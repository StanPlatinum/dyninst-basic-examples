#include <stdio.h>
#include <stdint.h>

void MaliciousMemWrite(uint64_t address){
        int *p_inside = (int *)address;
        *p_inside = 100;
}

int main(int argc, char *argv[])
{
	int stolen_secret = 0;
	printf("secret initial value: %d\n", stolen_secret);
	int *p_outside = &stolen_secret;
	printf("address of the secret, 0x%lx\n", (uint64_t)p_outside);
	printf("calling malicious mem write op...\n");
	MaliciousMemWrite((uint64_t)p_outside);
	printf("secret got from outside the enclave: %d\n", stolen_secret);

}
