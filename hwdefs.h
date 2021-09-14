#ifndef HWDEFS_H_INCLUDED
#define HWDEFS_H_INCLUDED

#include <avr/io.h>
#include <avr/interrupt.h>

#define UPDATE_FLAG_ADDR 0
#define UPDATE_FLAG 0xAA

#define USART_BAUD 10000
#define SETUP_RX_PINCHANGE_IRQ()    PCICR |= 1 << PCIE0
#define ENABLE_RX_PINCHANGE_IRQ()   PCMSK0 |= 1 << PCINT0
#define DISABLE_RX_PINCHANGE_IRQ()  PCMSK0 &= ~(1 << PCINT0)
#define ENABLE_CLOCK_IRQ()          TIFR0 = 1 << OCF0A;    \
                                    TIMSK0 |= 1 << OCIE0A
#define DISABLE_CLOCK_IRQ()         TIMSK0 &= ~(1 << OCIE0A)
//At 11.0592Mhz one counter period takes 740µs
#define SETUP_BIT_TIMER()           TCCR0A = 1 << WGM01; \
                                    TCCR0B = (1 << CS01); \
                                    OCR0A = (F_CPU / 8) / USART_BAUD - 1
#define RECV_TIMER_CAPT_ISR         ISR(TIMER0_COMPA_vect)
                                    
#define BIT_ONE_T (2*BIT_ZERO_T)
#define BIT_ZERO_MIN  (uint16_t)(0.5 * BIT_ZERO_T * (F_CPU / 1000000))
#define BIT_ZERO_MAX  (uint16_t)(1.5 * BIT_ZERO_T * (F_CPU / 1000000))
#define BIT_ONE_MAX (uint16_t)(2 * BIT_ZERO_MAX)
#define BIT_ONE_MIN BIT_ZERO_MAX

#define IRFRQ                       38000
#define MIN_IR_DCYCLE               10
#define MAX_IR_DCYCLE               50
#define DEF_IR_DCYCLE               25
#define COUNTER_AT_IRQFRQ           (F_CPU / (2 * IRFRQ))

#ifdef IR
#define BIT_ZERO_T 250
#define ENABLE_IROUT()              TCCR1A |= (1 << COM1A1) | (1 << COM1A0)
#define DISABLE_IROUT()             TCCR1A &= ~(1 << COM1A1) & ~(1 << COM1A0)
#define TOGGLE_IROUT()              TCCR1A ^= (1 << COM1A1) | (1 << COM1A0)
#define STATE_IROUT                 0
#define DUTYCYCLE_COR               0
#else
#define BIT_ZERO_T                  100
#define TX_START()                  TX_PORT |= TX_PIN
#define TX_STOP()                   TX_PORT &= ~TX_PIN
#define TX_TOGGLE()                 TX_PORT ^= TX_PIN
#define RX_INPUT_STATE              ((RX_INPUT & RX_PIN) > 0)
#define TX_STATE                    ((TX_PORT & TX_PIN) > 0)
#define DUTYCYCLE_COR               0 //(((F_CPU / 32) * 0/*10*/) / 1000000)
#endif // IR

#define SET_COUNTER(x)              TCNT1 = x
#define TOGGLE_EDGE_POLARITY()      TCCR1B ^=  (1 << ICES1)
#define SET_START_EDGE_POLARITY() \
\
if (RX_INPUT_STATE) \
   TCCR1B &= ~(1 << ICES1); /* falling edge */ \
else \
   TCCR1B |= (1 << ICES1); //rising edge

#define CAPT_VALUE                  ICR1
#define SET_IR_FRQ()                ICR1 = COUNTER_AT_IRQFRQ
#define SET_IR_DUTYCYCLE(d)         OCR1A = (COUNTER_AT_IRQFRQ - (d * COUNTER_AT_IRQFRQ) / 100)

#define CONFIG_TIMER_CAPT_MODE()    TCCR1A = 0;   \
                                    TCCR1B = (1 << ICNC1) | (1 << CS10)

#define CONFIG_TIMER_PWM_MODE()     TCCR1A = 1 << WGM11;  \
                                    TCCR1B = (1 << WGM13) | (1 << CS10)

#define RESET_BIT_COUNTER()         TCNT2 = 0
#define GET_BIT_COUNTER()           TCNT2

#define RD_LED_DDR                  DDRD
#define RD_LED_PORT                 PORTD
#define RD_LED_PIN                  (1 << PIN5)

#define TX_DDR                      DDRB
#define TX_PORT                     PORTB
#define RX_INPUT                    PINB
#define TX_INPUT                    PINB
#define RX_PIN                      (1 << PIN0)
#define TX_PIN                      (1 << PIN1)

#define TX_HIGH()                   TX_PORT |= TX_PIN
#define TX_LOW()                    TX_PORT &= ~TX_PIN
#define SAMPLE()                    (inverted) ? (RX_INPUT & RX_PIN) == 0 : (RX_INPUT & RX_PIN) != 0

#define TXEN_DDR                    DDRD
#define TXEN_PORT                   PORTD
#define TXEN_PIN                    (1 << PIN2)

#define RXEN_DDR                    DDRD
#define RXEN_PORT                   PORTD
#define RXEN_PIN                    (1 << PIN7)

#define DISABLE_OVF_CAPT_IRQ()      TIMSK1 &= ~(1 << ICIE1) & ~(1 << TOIE1)
#define ENABLE_OVF_CAPT_IRQ()       TIFR1 = (1 << ICF1);    \
                                    TIMSK1 |= (1 << ICIE1) | (1 << TOIE1)
                                    
#define BIT_TIMER_ZERO              (((F_CPU / 32) * BIT_ZERO_T) / 1000000)
#define BIT_TIMER_ONE               (((F_CPU / 32) * BIT_ONE_T) / 1000000)

#define ADDR_DDR                     DDRC
#define ADDR_PORT                    PORTC
#define ADDR_MASK                    0x7
#define ADDR1_LSB                    0
#define ADDR2_LSB                    3
#define ADDR1_IN                    ((PINC >> ADDR1_LSB) & ADDR_MASK)
#define ADDR2_IN                    ((PINC >> ADDR2_LSB) & ADDR_MASK)
#define SET_ADR_OUT(a)              ADR_PORT &= ~(ADR_MASK << ADR_OUT_LSB); \
                                    ADR_PORT |= (a) << ADR_OUT_LSB
#endif // HWDEFS_H_INCLUDED
