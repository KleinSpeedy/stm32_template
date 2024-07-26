# STM32 Hardware abstraction and CMSIS layer for Cortex specific configuration

# Include configuration

cmsis_core_incs = include_directories('./STM32CubeF4/Drivers/CMSIS/Include')
cmsis_device_incs = include_directories('./STM32CubeF4/Drivers/CMSIS/Device/ST/STM32F4xx/Include')
hal_incs = include_directories('./STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Inc')

incs += cmsis_core_incs
incs += cmsis_device_incs
incs += hal_incs

# Source configuration

stm32_cube_dir = meson.current_source_dir() / 'STM32CubeF4'

hal_srcs_dir = stm32_cube_dir / 'Drivers/STM32F4xx_HAL_Driver/Src/'
cmsis_srcs_dir = stm32_cube_dir / 'Drivers/CMSIS/'

# CMSIS sources
cmsis_srcs = [
  './STM32CubeF4/Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/system_stm32f4xx.c'
]

stm32_cube_srcs += files(cmsis_srcs)

# HAL sources
stm32_hal_srcs = [
  #'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/Legacy/stm32f4xx_hal_can.c',
  #'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/Legacy/stm32f4xx_hal_eth.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_adc.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_adc_ex.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_can.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_cec.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_cortex.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_crc.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_cryp.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_cryp_ex.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dac.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dac_ex.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dcmi.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dcmi_ex.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dfsdm.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma2d.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dma_ex.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_dsi.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_eth.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_exti.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ex.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_flash_ramfunc.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_fmpi2c.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_fmpi2c_ex.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_fmpsmbus.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_fmpsmbus_ex.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_gpio.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_hash.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_hash_ex.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_hcd.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2c.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2c_ex.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2s.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2s_ex.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_irda.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_iwdg.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_lptim.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_ltdc.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_ltdc_ex.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_mmc.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_msp_template.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_nand.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_nor.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pccard.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pcd.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pcd_ex.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr_ex.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_qspi.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc_ex.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rng.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rtc.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rtc_ex.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_sai.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_sai_ex.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_sd.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_sdram.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_smartcard.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_smbus.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_spdifrx.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_spi.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_sram.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim.c',
  #'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_timebase_rtc_alarm_template.c',
  #'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_timebase_rtc_wakeup_template.c',
  #'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_timebase_tim_template.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim_ex.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_uart.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_usart.c',
  'STM32CubeF4/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_wwdg.c'
]

stm32_cube_srcs += files(stm32_hal_srcs)
