CC = avr-gcc
OBJCOPY = avr-objcopy
AVRDUDE := avrdude
# Main application file name
MAIN_APP = main
# Define F_CPU
F_CPU = 16000000
MAIN_HEX_PATH = $(MAIN_APP).hex
# Options for avr-gcc
CFLAGS = -g -Os
CFLAGS += -D F_CPU=$(F_CPU)
CFLAGS += -o
# Linking options for avr-gcc
LFLAGS = -Os -mmcu=atmega2560
LFLAGS += -D F_CPU=$(F_CPU)
LFLAGS += -o
# Options for HEX file generation
HFLAGS = -j .text -j .data -O ihex

DUDFLAGS = -c wiring
DUDFLAGS += -p m2560
DUDFLAGS += -P /dev/ttyUSB0
DUDFLAGS += -b 115200
DUDFLAGS += -U flash:w:$(MAIN_APP).hex:i -D

# Sources files needed for building the application
SRC = $(MAIN_APP).c ./libs/*.c

# The headers files needed for building application
INCLEDE = -I.

# Command section
Burn: Build
	$(AVRDUDE) $(DUDFLAGS)

Build: $(MAIN_APP).elf
	$(OBJCOPY) $(HFLAGS) $< $(MAIN_APP).hex

$(MAIN_APP).elf: $(MAIN_APP).o
	$(CC) $(SRC) $(INCLEDE) $(LFLAGS) $@

$(MAIN_APP).o: $(SRC)
	$(CC) $^ $(INCLEDE) $(CFLAGS) $@

clean:
	rm $(MAIN_APP).o
	rm $(MAIN_APP).elf
	rm $(MAIN_APP).hex