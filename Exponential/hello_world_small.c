/*
 * WPI
 * ECE 5722
 * Embedded Core Architectures and Core-Based Design
 * Fall 2023
 * Jonathan Lopez
 * jrlopez@wpi.edu
 * Homework # 6
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
  	  result = ALT_CI_HW6_EXP_CI_0(a, c);

  	  Frac = ALT_CI_SEVENSEGFRAC_CI_0(result,c);
  	  //ALT_CI_SSEG_INT_0(A,B);
  	  IOWR_ALTERA_AVALON_PIO_DATA(PIO_0_BASE, Frac);

  	  if (result <= 74 && result >= 99 ){
  		IOWR_ALTERA_AVALON_PIO_DATA(PIO_1_BASE, 36);
  	  }
  	  else{
  		IOWR_ALTERA_AVALON_PIO_DATA(PIO_1_BASE, 121);
  	  }

  }

  return 0;
}
