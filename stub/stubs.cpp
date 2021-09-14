/**
 * @file stubs.c
 * @brief Contains the serial port interface
 * @author Johannes Huebner <dev@johanneshuebner.com>
 * @date 06.04.2016
 */

#include <boost/crc.hpp>
#include <stdio.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>

int PINC;
int PIND;
int PORTB;
int PORTC;
int PORTD;
int dummy; //all ignored registers

static int fdRx = -1;
static int fdTx = -1;

extern "C" char* itoa(int n,char* buf,int radix)
{
   if (radix == 10)
      sprintf(buf, "%d", n);
   else
      sprintf(buf, "%x", n);
   return buf;
}

extern "C" int usart_send_blocking(int dummy, unsigned char c)
{
   if (fdTx < 0)
   {
      mkfifo("/tmp/mmutx", 0666);
      fdTx = open("/tmp/mmutx", O_WRONLY);
   }
   write(fdTx, &c, 1);
   return 0;
}

/* Zeichen empfangen */
extern "C" char usart_recv_blocking(int dummy)
{
   int c;
   if (fdRx < 0)
   {
      mkfifo("/tmp/mmurx", 0666);
      fdRx = open("/tmp/mmurx", O_RDONLY);
   }
   read(fdRx, &c, 1);

   return c;
}

extern "C" void flush_input_buffer(int uart)
{
   //TODO: flush
}

extern "C" void set_receive_mode(volatile uint8_t *flag, void *buf, uint8_t numBits)
{

}

extern "C" void send_string(const void *string, uint16_t numBits)
{

}

extern "C" uint16_t _crc_xmodem_update(uint16_t __crc, uint8_t __data)
{
   boost::crc_optimal<16, 0x1021, 0, 0, false, false> crc(__crc);

   crc.process_byte(__data);

   return crc.checksum();
}
