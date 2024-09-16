/*
 * "Hello World" example.
 *
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example
 * designs. It runs with or without the MicroC/OS-II RTOS and requires a STDOUT
 * device in your system's hardware.
 * The memory footprint of this hosted application is ~69 kbytes by default
 * using the standard reference design.
 *
 * For a reduced footprint version of this template, and an explanation of how
 * to reduce the memory footprint for a given application, see the
 * "small_hello_world" template.
 *
 */
#include <stdio.h>
#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "sys/alt_stdio.h"
#include "io.h"
#define LARGE_BASE 0x4030
#define SMALL_BASE 0x4020
int main()
{
    int i,j;
    uint16_t* i = 0x0900; // data start index
	uint16_t* j = 0x0940; // data end index
    while (1){	   
		int n = j - i; // set of data size
		int swapped, k;
		uint16_t* place1, place2;
		while (swapped) {
			swapped = 0;
			for (k = 0; k < n; k++) {
				place1 = i + k;
				place2 = place1 + 1;
				if (*place1 < *place2) {
					int temp = *place1; // swap values
					*loc1 = *place2;
					*place2 = temp;
					swapped++;
				}
			}
		} 
	   IOWR_ALTERA_AVALON_PIO_DATA(LARGE_BASE, (ram_ptr[0]&0x000000FF));
	   IOWR_ALTERA_AVALON_PIO_DATA(SMALL_BASE, (ram_ptr[63]&0x000000FF));
	   }
    return 0;
}
