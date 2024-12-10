#include "stm32f446xx.h"

int main()
{
    RCC->AHB1ENR |= 1 << 0;

    GPIOA->MODER |= 1 << 10;

    while (1)
    {
        GPIOA->ODR ^= 1 << 5;
        for (int i = 0; i < 500000; i++)
            ;
    }
    return 0;
}