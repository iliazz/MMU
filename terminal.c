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

#define STM32F1

#include <string.h>
#include "terminal.h"

#define BUFSIZE 32

static const TERM_CMD *CmdLookup(char *buf);
static void term_send(int usart, const char *str);

extern const TERM_CMD TermCmds[];
static char inBuf[BUFSIZE];
static int _usart;

/** Run the terminal */
void term_Run(int usart)
{
   int idx = 0;
   char *argStart = NULL;
   char *argLast = NULL;
   const TERM_CMD *pCurCmd = NULL;
   const TERM_CMD *pLastCmd = NULL;
   char c;
   _usart = usart;

   while (1)
   {
      c = usart_recv_blocking(usart);
      //usart_send_blocking(usart, c);

      if ('\n' == c)
      {
         if (NULL != pCurCmd)
         {
            pCurCmd->CmdFunc(argStart);
         }
         /*else
         {
            term_send(usart, "Unknown command sequence\n");
         }*/
         idx = 0;
         argLast = argStart;
         pLastCmd = pCurCmd;
         argStart = NULL;
         pCurCmd = NULL;
      }
      else if ('!' == c)
      {
         if (NULL != pLastCmd)
         {
            pLastCmd->CmdFunc(argLast);
         }
         idx = 0;
      }
      else
      {
         inBuf[idx] = c;
         if (idx < (BUFSIZE - 1))
         {
            idx++;
         }
         inBuf[idx] = 0;
         if (NULL == argStart)
         {
            pCurCmd = CmdLookup(inBuf);
            if (NULL != pCurCmd)
            {
               argStart = &inBuf[idx];
            }
         }
      }
   } /* while(1) */
} /* term_Run */

int putchar(int c)
{
   usart_send_blocking(_usart, c);
   return 0;
}

static const TERM_CMD *CmdLookup(char *buf)
{
   const TERM_CMD *pCmd = TermCmds;

   for (; NULL != pCmd->cmd; pCmd++)
   {
      if (0 == strcmp(buf, pCmd->cmd))
      {
         break;
      }
   }
   if (NULL == pCmd->cmd)
   {
      pCmd = NULL;
   }
   return pCmd;
}

static void term_send(int usart, const char *str)
{
   for (;*str > 0; str++)
       usart_send_blocking(usart, *str);
}

void term_puts(const char *str)
{
   term_send(_usart, str);
}
