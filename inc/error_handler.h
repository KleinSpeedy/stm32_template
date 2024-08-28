#ifndef ERROR_HANDLER_H
#define ERROR_HANDLER_H

#ifdef __cplusplus
 extern "C" {
#endif

typedef enum ErrorReason {
    ERROR_NONE = 0,
    ERROR_SYS_CLOCK_INIT,
    ERROR_GPIO_INIT,
    ERROR_UART_INIT,
    ERROR_GPIO_LOCK,

    NUM_ERRORS
}ErrorReason;

void Error_Handler(ErrorReason reason);

#ifdef __cplusplus
}
#endif

#endif // ERROR_HANDLER_H
