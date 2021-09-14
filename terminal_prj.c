/*
 * This file is part of the tumanako_vc project.
 *
 * Copyright (C) 2011 Johannes Huebner <dev@johanneshuebner.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include "terminal.h"
#include "sercom.h"
#include "bms_shared.h"
#include "hwdefs.h"
#include "utils.h"
#include "uart.h"
#include "hamming.h"
#include <util/delay.h>
#include <util/crc16.h>
#include <avr/eeprom.h>
#include <avr/wdt.h>
#include <stdint.h>
#include <stdlib.h>

VERSION(version, 2,0,2,'B',2,'A');

struct cmd cmd;
struct BatValues vals;
extern uint8_t comAddr;

static void get(char *arg);
static void versionMMU(char *arg);
static void versionCMU(char *arg);
static void print(char *arg);
static void setadr(char *arg);
static void resetadr(char *arg);
static void calib(char *arg);
static void setshunt(char *arg);
static void update(char *arg);
static void updatemmu(char *arg);
static uint16_t OutputAndCalcCrc(uint16_t crc, const char* str);
static char* CreateAddrResponse(int8_t addr, char* buf);
static char* CheckAddr(char* arg);
static void PrintData();
static void PrintVersion(const struct version* ver, int8_t cmuAddress, uint32_t serial);

const TERM_CMD TermCmds[] =
{
   { "get", get },
   { "mmuver", versionMMU },
   { "cmuver", versionCMU },
   { "print", print },
   { "resetadr", resetadr },
   { "setadr", setadr },
   { "calib", calib },
   { "shunt", setshunt },
   { "cmupdate", update },
   { "mmupdate", updatemmu},
   { NULL, NULL }
};

static void get(char *arg)
{
   arg = CheckAddr(arg);
   if (0 == arg) return;
   cmd.addr = atoi(arg);
   cmd.op = OP_GETDATA;

   uint16_t encodedCmd = hamming_encode(*((uint16_t*)&cmd));
   send_break();
   send_string(&encodedCmd, sizeof(encodedCmd));

   set_receive_mode(&vals, sizeof(vals));
}

static void versionMMU(char *arg)
{
   arg = CheckAddr(arg);
   if (0 == arg) return;
   PrintVersion(&version, -1, 0);
   term_puts("\r\n");
}

static void versionCMU(char *arg)
{
   struct versionComm verCMU;
   uint8_t i, *p;
   uint16_t crc = 0;
   uint8_t timeout = 100;

   arg = CheckAddr(arg);
   if (0 == arg) return;
   cmd.addr = atoi(arg);
   cmd.op = OP_VERSION;

   uint16_t encodedCmd = hamming_encode(*((uint16_t*)&cmd));
   send_break();
   send_string(&encodedCmd, sizeof(encodedCmd));

   set_receive_mode(&verCMU, sizeof(verCMU));
   uint8_t numRecv = num_bytes_received();
   while (numRecv < sizeof(verCMU) && timeout > 0)
   {
      _delay_ms(10);
      timeout--;
      wdt_reset();
      numRecv = num_bytes_received();
   }

   for (i = 0, p = (uint8_t*)&verCMU; i < (sizeof(verCMU) - sizeof(crc)); i++, p++)
      crc = _crc_xmodem_update(crc, *p);

   if (numRecv == sizeof(verCMU) && crc == verCMU.crc)
      PrintVersion(&verCMU.version, cmd.addr, verCMU.serialNumber);
   else
      term_puts("No valid reply.");

   term_puts("\r\n");
}

static void print(char *arg)
{
   uint8_t i, *p;
   uint16_t crc = 0;

   if (!CheckAddr(arg)) return;

   for (i = 0, p = (uint8_t*)&vals; i < (sizeof(vals) - sizeof(crc)); i++, p++)
      crc = _crc_xmodem_update(crc, *p);

   uint8_t numRecv = num_bytes_received();

   if (numRecv != sizeof(vals))
   {
      char buf[10];
      term_puts("Invalid nunmber of bits: ");
      term_puts(itoa(numRecv, buf, 10));
   }
   else if (crc != vals.crc)
   {
      term_puts("Invalid CRC");
   }
   else
   {
      PrintData(&vals);
   }

   term_puts("\r\n");
}

static void calib(char *arg)
{
/*   uint8_t timeout = 100;
   char buf[10];

   arg = CheckAddr(arg);
   if (0 == arg) return;
   uint8_t addr = atoi(arg);

   while (0 != *arg && ' ' != *arg)
      arg++;

   uint8_t chan = atoi(arg++);

   while (0 != *arg && ' ' != *arg)
      arg++;

   int16_t change = atoi(arg);

   cmd.op = OP_CALIB;
   cmd.addr = addr;
   cmd.arg = ((change << CALIB_CHAN_BITS) & CALIB_VAL_MASK) | chan;

   uint16_t encodedCmd[2];
   encodedCmd[0] = hamming_encode(*((uint16_t*)&cmd));
   encodedCmd[1] = hamming_encode(cmd.arg);

   send_string(encodedCmd, NUM_PARAM_BITS);

   numRecv = 0;
   set_receive_mode(&numRecv, encodedCmd, 16);

   while (numRecv < 16 && timeout > 0)
   {
      _delay_ms(10);
      timeout--;
      wdt_reset();
   }

   if (numRecv == 16)
   {
      term_puts("calib ");
      term_puts(CreateAddrResponse(addr, buf));
      term_puts(":");
      term_puts(utoa(encodedCmd[0], buf, 10));
   }
   else
   {
      term_puts("Calib command failed");
   }

   term_puts("\r\n");
*/
}

static void setshunt(char *arg)
{
   uint8_t timeout = 100;

   arg = CheckAddr(arg);
   if (0 == arg) return;
   uint8_t adr = atoi(arg);

   while (0 != *arg && ' ' != *arg)
      arg++;

   uint16_t shuntMask = atoi(arg);

   if (shuntMask > 15)
   {
      term_puts("Invalid argument\r\n");
      return;
   }

   cmd.op = OP_SHUNTON;
   cmd.addr = adr;
   cmd.arg = shuntMask;

   uint16_t encodedCmd[2];
   uint16_t decodedResponse;
   encodedCmd[0] = hamming_encode(*((uint16_t*)&cmd));
   encodedCmd[1] = hamming_encode(cmd.arg);
   send_break();
   send_string(encodedCmd, sizeof(encodedCmd));

   set_receive_mode(encodedCmd, sizeof(uint16_t));

   uint8_t numRecv = num_bytes_received();
   while (numRecv < sizeof(uint16_t) && timeout > 0)
   {
      _delay_ms(10);
      timeout--;
      wdt_reset();
      numRecv = num_bytes_received();
   }

   char buf[10];
   if (numRecv == sizeof(encodedCmd[0]) && hamming_decode(encodedCmd[0], &decodedResponse) == DEC_RES_OK)
   {
      term_puts("shunt ");
      term_puts(CreateAddrResponse(adr, buf));
      term_puts(":");
      term_puts(itoa(decodedResponse, buf, 10));
   }
   else
   {
      term_puts("Shunt command failed: ");
      term_puts(itoa(numRecv, buf, 10));
   }

   term_puts("\r\n");
}

static void setadr(char *arg)
{
   arg = CheckAddr(arg);
   if (0 == arg) return;
   uint8_t timeout = 100;
   uint16_t encodedCmd = (OP_SETADDR << 8) | 1;

   encodedCmd = hamming_encode(encodedCmd);
   send_break();
   send_string(&encodedCmd, sizeof(encodedCmd));
   set_receive_mode(&encodedCmd, sizeof(encodedCmd));

   uint8_t numRecv = num_bytes_received();
   while (numRecv < NUM_CMD_BITS && timeout > 0)
   {
      _delay_ms(10);
      timeout--;
      wdt_reset();
      numRecv = num_bytes_received();
   }

   if (numRecv == NUM_CMD_BITS && hamming_decode(encodedCmd, (uint16_t*)&cmd) == DEC_RES_OK)
   {
      char buf[10];
      term_puts("found ");
      term_puts(itoa(cmd.addr - 1, buf, 10));
      term_puts("\r\n");
   }
}

static void resetadr(char *arg)
{
   arg = CheckAddr(arg);
   if (0 == arg) return;

   //Wake up device
   send_string("\0", 0);
   _delay_ms(20);

   cmd.op = OP_ADDRMODE;
   cmd.addr = 0xaa;

   uint16_t encodedCmd = hamming_encode(*((uint16_t*)&cmd));
   send_break();
   send_string(&encodedCmd, sizeof(encodedCmd));
   term_puts("Issued command\r\n");
}

static void update(char *arg)
{
   uint8_t buf[sizeof(struct PageBuf)];

   //Wake up device
   send_break();
   _delay_ms(100);
   cmd.op = OP_BOOT;
   cmd.addr = 0xaa;
   uint16_t encodedCmd = hamming_encode(*((uint16_t*)&cmd));
   send_string(&encodedCmd, sizeof(encodedCmd));
   _delay_ms(100);
   flush_input_buffer(0);

   while (1)
   {
      //char okFlag = 0x1;

      for (uint8_t i = 0; i < sizeof(buf); i++)
         buf[i] = usart_recv_blocking(0);

      send_string(buf, sizeof(buf));
      //numRecv = 0;
      //set_receive_mode(&numRecv, &okFlag, 1);
      //_delay_ms(10);

      //if (numRecv > 0)
      //   term_puts("E");
      //buf[0] contains page number
      if (buf[0] == (ATTINY_MAX_APPLICATION_PAGES - 1))
      {
         RD_LED_PORT |= RD_LED_PIN;
         _delay_ms(1000);
         RD_LED_PORT &= ~RD_LED_PIN;
         return;
      }

      flush_input_buffer(0);
   }
}

static void updatemmu(char *arg)
{
   eeprom_write_byte(UPDATE_FLAG_ADDR, UPDATE_FLAG);
   while(1); //wait for watchdog timeout
}

static void PrintData(struct BatValues* vals)
{
   char buf[10];
   uint16_t crc = 0x0;

   crc = OutputAndCalcCrc(crc, "val ");
   crc = OutputAndCalcCrc(crc, CreateAddrResponse(vals->adr, buf));
   crc = OutputAndCalcCrc(crc, ":");
   for (uint8_t i = 0; i < (NUM_VALUES-1); i++)
   {
      crc = OutputAndCalcCrc(crc, itoa(vals->values[i], buf, 10));
      crc = OutputAndCalcCrc(crc, ",");
   }
   crc = OutputAndCalcCrc(crc, itoa(((int8_t)vals->values[NUM_VALUES-1] & 0xFF), buf, 10));
   crc = OutputAndCalcCrc(crc, ",");
   term_puts(itoa(crc, buf, 16));
}

static void PrintVersion(const struct version* ver, int8_t cmuAddress, uint32_t serial)
{
   char buf[16];
   uint16_t crc = 0x0;

   crc = OutputAndCalcCrc(crc, "ver ");
   crc = OutputAndCalcCrc(crc, CreateAddrResponse(cmuAddress, buf));
   crc = OutputAndCalcCrc(crc, ":");
   crc = OutputAndCalcCrc(crc, FormatSwVersion(buf, ver));
   crc = OutputAndCalcCrc(crc, ",");
   crc = OutputAndCalcCrc(crc, FormatHwVersion(buf, ver));
   crc = OutputAndCalcCrc(crc, ",");
   crc = OutputAndCalcCrc(crc, ultoa(serial, buf, 10));
   crc = OutputAndCalcCrc(crc, ",");
   term_puts(itoa(crc, buf, 16));
}

static uint16_t OutputAndCalcCrc(uint16_t crc, const char* str)
{
   term_puts(str);
   for (;*str > 0; str++)
      crc = _crc_xmodem_update(crc, *str);
   return crc;
}

//Print address, if addr=-1 it is omitted
static char* CreateAddrResponse(int8_t addr, char* buf)
{
   itoa(comAddr, buf++, 10);
   if (addr >= 0)
   {
      *(buf++) = '.';
      itoa(addr, buf, 10);
      buf--;
   }
   return buf-1;
}

static char* CheckAddr(char* arg)
{
   for (; *arg == ' '; arg++);
   arg[1] = 0;
   if (atoi(arg) != comAddr) return 0;
   return arg + 2;
}

