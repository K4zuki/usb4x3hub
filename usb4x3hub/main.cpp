#include <mbed.h>

DigitalOut OE(P0_13, 1);
BusOut SEL(P0_7,P0_6);
/*
InterruptIn SW1(P0_3);
InterruptIn SW2(P0_2);
InterruptIn SW3(P0_11);
InterruptIn SW4(P0_10);
*/
InterruptIn SW1(P0_8);
InterruptIn SW2(P0_1);
InterruptIn SW3(P0_9);
InterruptIn SW4(P0_10);
BusOut LSEL(P0_3,P0_2);

// Setup the Serial to the PC for debugging
Serial pc(P0_4, P0_0);


void SW1_int()
{
    OE = 1;
    SEL = 0;
    LSEL = 0;
    OE = 0;
    pc.printf("SW1\n\r");
}

void SW2_int()
{
    OE = 1;
    SEL = 1;
    LSEL = 1;
    OE = 0;
    pc.printf("SW2\n\r");
}

void SW3_int()
{
    OE = 1;
    SEL = 2;
    LSEL = 2;
    OE = 0;
    pc.printf("SW3\n\r");
}

void SW4_int()
{
    OE = 1;
    SEL = 3;
    LSEL = 3;
    OE = 0;
    pc.printf("SW4\n\r");
}

int main()
{

    pc.baud(57600);
    pc.printf("\nHello from USB4x3HUB \n\r");

    OE = 1;
    SEL = 0;
    LSEL = 0;
    OE = 0;

    SW1.fall(&SW1_int);
    SW1.mode(PullUp);
    SW2.fall(&SW2_int);
    SW2.mode(PullUp);
    SW3.fall(&SW3_int);
    SW3.mode(PullUp);
    SW4.fall(&SW4_int);
    SW4.mode(PullUp);

    while (1) {
        wait(5);
        pc.printf(".");
    }
}
