/*
 * This file contains the headers of the interrupt handlers and was copied from
 * the STM32F429 Project template.
 *
 * Copyright (c) 2017 STMicroelectronics.
 * All rights reserved.
 *
 * This software is licensed under terms that can be found in the LICENSE file
 * in the root directory of this software component.
 * If no LICENSE file comes with this software, it is provided AS-IS.
 */

#ifndef SYSTEM_HANDLERS_H
#define SYSTEM_HANDLERS_H

#ifdef __cplusplus
 extern "C" {
#endif

void Default_Handler(void);

void NMI_Handler(void);
void HardFault_Handler(void);
void MemManage_Handler(void);
void BusFault_Handler(void);
void UsageFault_Handler(void);
void SVC_Handler(void);
void DebugMon_Handler(void);
void PendSV_Handler(void);
void SysTick_Handler(void);

#ifdef __cplusplus
}
#endif

#endif /* SYSTEM_HANDLERS_H */
