/*
Jonathan Lopez
ECE 5722 Fall 2023 WPI
Final Exam Question # 2
Accelerator for Tanh(2x)
*/

volatile uint32_t *start_signal;
volatile uint32_t *done_signal;
volatile uint32_t *result;

#include <stdio.h>
#include "system.h"
#include "sys/alt_stdio.h"
#include "altera_avalon_pio_regs.h"
#include "io.h"
#include "math.h"
#include <stdint.h>
#include <unistd.h>


//NEED 5 seven segment displays

typedef enum SEVEN_SEGMENTS {
    SEVEN_SEG_0 = SEVEN_SEG_0_BASE, 
    SEVEN_SEG_1 = SEVEN_SEG_1_BASE, 
    SEVEN_SEG_2 = SEVEN_SEG_2_BASE,
	SEVEN_SEG_3 = SEVEN_SEG_3_BASE, 
    SEVEN_SEG_4 = SEVEN_SEG_4_BASE, 
    SEVEN_SEG_5 = SEVEN_SEG_5_BASE
    } SEVEN_SEGMENTS;

// 0-F bit output
unsigned char bit_output(unsigned char sevSeg) {

	switch (sevSeg) {
		case 0: sev_output = 0x40;
			break;
		case 1: digit = 0x79; 
			break;
		case 2: sev_output = 0x24;
			break;
		case 3: sev_output = 0x30; 
			break;
		case 4: sev_output = 0x19; 
			break;
		case 5: sev_output = 0x12; 
			break;
		case 6: sev_output = 0x02;
			break;
		case 7: sev_output = 0x78; 
			break;
		case 8: sev_output = 0x00; 
			break;
		case 9: sev_output = 0x10; 
			break;
		case 10: sev_output = 0x08; 
			break;
		case 11: sev_output = 0x03; 
			break;
		case 12: sev_output = 0x46; 
			break;
		case 13: sev_output = 0x21; 
			break;
		case 14: sev_output = 0x06; 
			break;
		case 15: sev_output = 0x0E; 
			break;
		default: sev_output = 0xFF;
			break;
	}
	return sev_output;
}


void display_result(unsigned int result, unsigned int toggle) {

    unsigned int mask = 7; // F
    unsigned char seg0, seg1, seg2, seg3, seg4, seg5;

    //Shift the result
	seg0 = bit_output(result & mask);
	seg1 = bit_output((result & (mask << 4)) >> 4);
	seg2 = bit_output((result & (mask << 8)) >> 8);
	seg3 = bit_output((result & (mask << 12)) >> 12);
	seg4 = 0x77;
	seg5 = bit_output((result & (mask << 16)) >> 16);

	switch (toggle) {
		case 0:
			IOWR_ALTERA_AVALON_PIO_DATA(SEVEN_SEG_0, seg0);
			IOWR_ALTERA_AVALON_PIO_DATA(SEVEN_SEG_1, seg1);
			IOWR_ALTERA_AVALON_PIO_DATA(SEVEN_SEG_2, seg2);
			IOWR_ALTERA_AVALON_PIO_DATA(SEVEN_SEG_3, seg3);
			IOWR_ALTERA_AVALON_PIO_DATA(SEVEN_SEG_4, seg4);
			IOWR_ALTERA_AVALON_PIO_DATA(SEVEN_SEG_5, seg5);
			break;
		case 1:
			IOWR_ALTERA_AVALON_PIO_DATA(SEVEN_SEG_0, 0xFF);
			IOWR_ALTERA_AVALON_PIO_DATA(SEVEN_SEG_1, 0xFF);
			IOWR_ALTERA_AVALON_PIO_DATA(SEVEN_SEG_2, 0xFF);
			IOWR_ALTERA_AVALON_PIO_DATA(SEVEN_SEG_3, 0xFF);
			IOWR_ALTERA_AVALON_PIO_DATA(SEVEN_SEG_4, 0xFF);
			IOWR_ALTERA_AVALON_PIO_DATA(SEVEN_SEG_5, 0xFF);
			break;
        default:
			IOWR_ALTERA_AVALON_PIO_DATA(SEVEN_SEG_0, 0xFF);
			IOWR_ALTERA_AVALON_PIO_DATA(SEVEN_SEG_1, 0xFF);
			IOWR_ALTERA_AVALON_PIO_DATA(SEVEN_SEG_2, 0xFF);
			IOWR_ALTERA_AVALON_PIO_DATA(SEVEN_SEG_3, 0xFF);
			IOWR_ALTERA_AVALON_PIO_DATA(SEVEN_SEG_4, 0xFF);
			IOWR_ALTERA_AVALON_PIO_DATA(SEVEN_SEG_5, 0xFF);
			break;

	}

}

float tanh2x(float data_x){
    float result = 0.0;
    
    float x2Data_x = data_x * 2; 
    
    while (!(*done_signal));

    uint32_t accl_result = (uint32_t)(*result);
    //mult input for get tanh2x
    //tanh(2x)=2⋅tanh(x)⋅(1−tanh2(x))
    uint32_t tanh2x_result = 2 * accl_result * (1 - accl_result * accl_result);
    
    return tanh2x_result;
}


void main(){
    float result = 0;
    uint32_t toggle = 1;
    uint32_t start = 0;
    display_result(result, toggle)
    while(1){ //forever loop
        data_x = IORD_ALTERA_AVALON_PIO_DATA(data_x_BASE);
        start = IORD_ALTERA_AVALON_PIO_DATA(START_BASE);
        result = tanh2x(data_x);
        toggle = 0;
        display_result(result, toggle);
    }
}


