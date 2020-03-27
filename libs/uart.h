#ifndef F_CPU
# warning "F_CPU not defined for <uart.h>"
# define F_CPU 1000000UL
#endif

#define BAUD 19200
#define BAUDRATE ((F_CPU)/(BAUD*16UL)-1)

void SetupUSART0 (void);
void UARTSend(unsigned char data);
void USART_putstring(char* StringPtr);