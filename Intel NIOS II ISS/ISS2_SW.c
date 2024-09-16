
#include "system.h"
#include "altera_avalon_pio_regs.h"



int main()
{ 
	int a[] = {16, 2, 27, 54, 32, 1};
	int MID = 0;
	int MAX = 0;
	int MIN = 255;
	int i;
	while(1){
		for (i=0; i<6; i = i+1){
			if (a[i] > MAX) MAX = a[i];
			else if (a[i] < MIN) MIN = a[i];
		}
		MID = (MAX+MIN)/2;
		IOWR_ALTERA_AVALON_PIO_DATA(PIO_0_BASE,MID);
		MIN = 0;
		MAX = 0;
	}
    return 0;
}
