# Startup file setup

plat = meson.get_cross_property('platform', '')
if plat == ''
  error('platform not specified')
endif

startup_file_asm = plat + '.S'

srclist += files(startup_file_asm)
srclist += files('system_handlers.c')
srclist += files('system_stm32f4xx.c')
srclist += files('syscalls.c')
srclist += files('sysmem.c')
