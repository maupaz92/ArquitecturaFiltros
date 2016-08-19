#include <stdio.h>
#include <string.h>

#include "alt_up_pci_lib.h"

#define LED_ADDRESS  0x00020000


int main()
{
	int fd;
	char control;

	// Open the device file
	if( alt_up_pci_open(&fd, "/dev/alt_up_pci0") ){
		return -1;
	}

	control = 15;  // controlled by the host PC
	if( alt_up_pci_read(fd, BAR0, LED_ADDRESS, &control, sizeof(control)) )
		return -1;
		
	unsigned char valor = (unsigned char) control;
	
	printf("datos es %u ", valor);

	// close the dev_file
	alt_up_pci_close(fd);

	return 0;
}
