/**
 * @file stubs.h
 * @brief Contains the serial port interface
 * @author Johannes Huebner <dev@johanneshuebner.com>
 * @date 06.04.2016
 */
#ifndef STUBS_H_
#define STUBS_H_


#include <stdio.h>

#define sei()
#define cli()

char* itoa(int n,char* buf,int radix);
void flush_input_buffer(int uart);

//Stubbed Port definitions
extern int PINC;
extern int PIND;
extern int PORTB;
extern int PORTC;
extern int PORTD;
extern int dummy;

//Ignored register definitions
#define DDRB dummy
#define DDRC dummy
#define DDRD dummy
#define TWCR dummy
#define UBRR0H dummy
#define UBRR0L dummy
#define UCSR0A dummy
#define UCSR0B dummy
#define UCSR0C dummy
#define U2X0 0
#define TXEN0 0
#define RXEN0 0
#define TXCIE0 0
#define UCSZ00 0
#define UCSZ01 0
#define EICRA dummy
#define ISC11 0
#define EIMSK dummy
#define INT1 0
#define TCCR0B dummy
#define CS00 0
#define CS01 0
#define CS02 0
#define TIMSK0 dummy
#define TOIE0 0
#define UDRE0 0
#define UDR0 dummy

//Interrupt handler
#define ISR(a) void a()

enum Pins
{
   PIN0, PIN1, PIN2, PIN3, PIN4, PIN5, PIN6, PIN7
};


#endif /* STUBS_H_ */
