#include "bool.h"
#include "stm32f4xx_hal.h"
#include "stm32f4xx_hal_gpio.h"

typedef enum ErrorReason{
    NO_ERR = 0,
    LOCK_ERR,

    NUM_ERR
}ErrorReason;

static void error_loop(enum ErrorReason err)
{
    (void)err;
    while(1)
    {
    }
}

int main(void)
{
    HAL_Init();

    // configuration of port A pin 1
    GPIO_InitTypeDef gpioInitA = {
        .Pin = GPIO_PIN_1,
        .Mode = GPIO_MODE_OUTPUT_PP,
        .Pull = GPIO_PULLUP,
        .Speed = GPIO_SPEED_LOW
    };

    HAL_GPIO_Init(GPIOA, &gpioInitA);

    // set pins to low
    HAL_GPIO_WritePin(GPIOA, GPIO_PIN_1, GPIO_PIN_RESET);

    // lock all pins to current configuration
    if(HAL_GPIO_LockPin(GPIOA, GPIO_PIN_All) != HAL_OK)
    {
        error_loop(LOCK_ERR);
    }

    while(TRUE)
    {
        HAL_GPIO_TogglePin(GPIOA, GPIO_PIN_1);
        HAL_Delay(10000);
    }

    return 0;
}
