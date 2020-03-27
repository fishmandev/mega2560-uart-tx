#ifndef __AVR_ATmega2560__
    #define __AVR_ATmega2560__
#endif

#include <avr/io.h>
#include <util/delay.h>
#include "libs/uart.h"

int main(void)
{
    SetupUSART0();
    while (1)
    {
        USART_putstring("Hello world!\n");
        _delay_ms(1000);
    }
    return 0;
}