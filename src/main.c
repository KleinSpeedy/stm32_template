#include "bool.h"
#include "stm32f429xx.h"
#include "stm32f4xx_hal.h"
#include "stm32f4xx_hal_gpio.h"

int main(void)
{
    HAL_Init();

    // configuration of port
    GPIO_InitTypeDef gpioInitA = {
        .Pin = GPIO_PIN_1,
        .Mode = GPIO_MODE_OUTPUT_PP,
        .Pull = GPIO_PULLUP,
        .Speed = GPIO_SPEED_FAST
    };

    HAL_GPIO_Init(GPIOA, &gpioInitA);

    // set pin to low
    HAL_GPIO_WritePin(GPIOA, GPIO_PIN_1, GPIO_PIN_RESET);

    while(TRUE)
    {
        HAL_GPIO_TogglePin(GPIOA, GPIO_PIN_1);
        // Delay 1s
        HAL_Delay(1000);
    }

    return 0;
}
