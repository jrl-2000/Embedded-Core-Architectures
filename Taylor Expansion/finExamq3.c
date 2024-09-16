/*
 * WPI
 * ECE 5722
 * Embedded Core Architectures and Core-Based Design
 * Fall 2023
 * Jonathan Lopez
 * jrlopez@wpi.edu
 * Final Exam Q3
 * Custom Instruction
 *
 */

#include "sys/alt_stdio.h"
#include "system.h"
#include "altera_avalon_pio_regs.h"
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdint.h>

#define delay 1000000

int main()
{ 
  //alt_putstr("Hello from Nios II!\n");

	int a, result, c, Frac, int_part;



  /* Event loop never exits. */
  while (1){
  	  a = IORD_ALTERA_AVALON_PIO_DATA(PIO_2_BASE);
  	  c = 0;
  	  result = ALT_CI_oneOver_CI_0(a, c);
  	  int_part = result >> 16;
  	  Frac = result << 16;

  	  //Frac = ALT_CI_SEVENSEGFRAC_CI_0(result,c);
  	  IOWR_ALTERA_AVALON_PIO_DATA(PIO_0_BASE, Frac);

  	  IOWR_ALTERA_AVALON_PIO_DATA(PIO_1_BASE, int_part);


  }

  return 0;
}
