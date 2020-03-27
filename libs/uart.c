#ifndef __AVR_ATmega2560__
    #define __AVR_ATmega2560__
#endif

#include <avr/io.h>
#include "uart.h"

void SetupUSART0 (void)
{
   UCSR0A = 0;
   UCSR0B |= (1 << RXEN0)|(1 << TXEN0);
   UCSR0C |= (1 << UCSZ01)|(1 << UCSZ00);
   UBRR0H = (BAUDRATE>>8);
   UBRR0L = BAUDRATE;
}

void UARTSend(unsigned char data) 
{
    while(!(UCSR0A & (1<<UDRE0)));
    UDR0 = data;
}

void USART_putstring(char* StringPtr)
{
    while(*StringPtr != 0x00) {
        UARTSend(*StringPtr);
        StringPtr++;
    } 
}