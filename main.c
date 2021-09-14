/*
 */

#include <stdlib.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/eeprom.h>
#include <avr/wdt.h>
#include <util/delay.h>
#define BAUD 115200
#include <util/setbaud.h>
#include "hwdefs.h"
#include "sercom.h"
#include "terminal.h"
#include "bms_shared.h"
#include "updater-uart.h"
#include "uart.h"

#define INVALID_ADDRESS 7
#define ADDRESS_READ_CNT 3

enum readAddrPhases
{
   PHASE_WAITADDR  = 0, /**< wait for one of the address ports to become != 7 */
   PHASE_READADDR1 = 1, /**< Read address from port 1 */
   PHASE_READADDR2 = 2, /**< Read address from port 2 */
   PHASE_DEBOUNCE  = 3, /**< Debounce address by reading it 3 times */
   PHASE_OUTADDR   = 4, /**< Output address+1 to next device */
   PHASE_DONE      = 5  /**< Exit state */
};

/** The application programs main entry function */
extern void __init();
static void ReadAddress(void);
static void HWInit(void);

volatile int16_t activityCounter = 0;
uint8_t comAddr = INVALID_ADDRESS;

void __attribute__((OS_main)) __attribute__ ((section (".bootloader"))) load(void)
{
   if (eeprom_read_byte(UPDATE_FLAG_ADDR) == UPDATE_FLAG)
   {
      Updater();
      eeprom_write_byte(UPDATE_FLAG_ADDR, 0);
   }

   //Jump to crt entry function. It will reset the stack pointer
   __init();
}

int main(void)
{
   char buf[20];

   HWInit();
   uart_initialize();
   sei();
   ReadAddress();

   term_puts("Address: ");
   term_puts(itoa(comAddr, buf, 10));

   term_Run(0);
   load(); //Pseudo call, so load is not optimized out
   return 0;
}

/** @brief Read COM address from address port.
 * There are two address ports, one comes from the previous
 * device on the bus, the other goes to the next device.
 * The port that shows an address != 7 is considered the
 * input port coming from the previous device. The other
 * is considered the output port going to the next device.
 *
 */
static void ReadAddress(void)
{
   uint8_t readCnt = 0, addrOut = 0, phase = PHASE_WAITADDR;
   uint8_t addr[ADDRESS_READ_CNT];

   ADDR_PORT |= (ADDR_MASK << ADDR1_LSB) | (ADDR_MASK << ADDR2_LSB);

   while (PHASE_DONE != phase)
   {
      wdt_reset();
      _delay_ms(50);
      switch (phase)
      {
         case PHASE_WAITADDR:
            readCnt = 0;
            RD_LED_PORT ^= RD_LED_PIN;
            if (ADDR1_IN != INVALID_ADDRESS)
               phase = PHASE_READADDR1;
            else if (ADDR2_IN != INVALID_ADDRESS)
               phase = PHASE_READADDR2;
            break;
         case PHASE_READADDR1:
            addr[readCnt] = ADDR1_IN;
            addrOut = ADDR2_LSB;
            phase = PHASE_DEBOUNCE;
            break;
         case PHASE_READADDR2:
            addr[readCnt] = ADDR2_IN;
            addrOut = ADDR1_LSB;
            phase = PHASE_DEBOUNCE;
            break;
         case PHASE_DEBOUNCE:
            readCnt++;
            if (readCnt < ADDRESS_READ_CNT)
            {
               if (addrOut == ADDR2_LSB)
                  phase = PHASE_READADDR1;
               else if (addrOut == ADDR1_LSB)
                  phase = PHASE_READADDR2;
            }
            else if ((addr[0] == addr[1]) && (addr[1] == addr[2]))
            {
               comAddr = addr[0];
               phase = PHASE_OUTADDR;
            }
            else
            {
               phase = PHASE_WAITADDR;
            }
            break;
         case PHASE_OUTADDR:
            ADDR_PORT &= ~((ADDR_MASK << ADDR1_LSB) | (ADDR_MASK << ADDR2_LSB));
            ADDR_PORT |= (comAddr + 1) << addrOut;
            ADDR_DDR |= ADDR_MASK << addrOut;
            phase = PHASE_DONE;
            break;
         default:
            //Should never get here
            RD_LED_PORT |= RD_LED_PIN;
      }
   }
   RD_LED_PORT &= ~RD_LED_PIN;
}

/*static void ReadAddress(void)
{
   uint8_t phase = PHASE_WAITADDR;
   uint8_t addr = 0;
   uint8_t flagOut = 1 << PIN3;

   PORTD |= (1 << PIN3) | (1 << PIN4); //Pullup on PD3 and PD4

   while (PHASE_DONE != phase)
   {
      wdt_reset();
      _delay_ms(50);
      switch (phase)
      {
         case PHASE_WAITADDR:
            RD_LED_PORT ^= RD_LED_PIN;
            if ((PIND & (1 << PIN3)) == 0)
            {
               phase = PHASE_READADDR1;
               flagOut = 1 << PIN4;
            }
            if ((PIND & (1 << PIN4)) == 0)
            {
               phase = PHASE_READADDR1;
               flagOut = 1 << PIN3;
            }
            flush_input_buffer(0);
            break;
         case PHASE_READADDR1:
            addr = usart_recv_blocking(0);
            PORTD &= ~flagOut;
            DDRD |= flagOut;
            phase = PHASE_OUTADDR;
            break;
         case PHASE_OUTADDR:
            comAddr = addr;
            usart_send_blocking(0, addr + 1);
            phase = PHASE_DONE;
            break;
         default:
            //Should never get here
            RD_LED_PORT |= RD_LED_PIN;
      }
   }
}*/

static void HWInit(void)
{
   //Aus irgend einem Grund ist I2C beim Start an
   //und blockiert PC4 und PC5 -> abschalten
   TWCR = 0;
   UBRR0H = UBRRH_VALUE;
   UBRR0L = UBRRL_VALUE;
#if USE_2X
   /* U2X-Modus erforderlich */
   UCSR0A |= (1 << U2X0);
#else
   /* U2X-Modus nicht erforderlich */
   UCSR0A &= ~(1 << U2X0);
#endif

   UCSR0B = (1<<TXEN0) | (1<<RXEN0) | (1<<TXCIE0);
   // Frame Format: Asynchron 8N1
   UCSR0C = (1<<UCSZ01) | (1<<UCSZ00);

   TX_DDR |= TX_PIN;
   RD_LED_DDR |= RD_LED_PIN;
   TXEN_DDR |= TXEN_PIN;
   PORTB |= 1 << PIN0;

   RXEN_DDR |= RXEN_PIN;
   ADDR_PORT = 0;

   wdt_enable(WDTO_2S);
}

ISR(USART_TX_vect)
{
   RD_LED_PORT &= ~RD_LED_PIN;
   TXEN_PORT &= ~TXEN_PIN;
}

ISR(BADISR_vect)
{
   RD_LED_PORT |= RD_LED_PIN;
}

