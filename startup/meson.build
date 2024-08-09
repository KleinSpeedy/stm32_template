# Startup file setup

plat = meson.get_cross_property('platform', '')
if plat == ''
  error('platform not specified')
endif

startup_file_asm = plat + '.S'

srclist += files(startup_file_asm)
srclist += files('vectors.S')
srclist += files('crt1.c')
