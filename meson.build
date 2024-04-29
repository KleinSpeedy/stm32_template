project('cross-compile-tutorial', 'c',
  default_options : ['c_std=c11', 'cpp_std=c++11'])

srcs = ['src/main.c']

cc = meson.get_compiler('c')

comp_flags = [
  '-falign-functions=16',
  '-fmerge-all-constants',
  '-mcpu=cortex-m4',
  '-ffunction-sections',
  '-fdata-sections',
  '-fno-common',
  '-mfloat-abi=hard',
  '-mfpu=fpv4-sp-d16',
  '-Wall',
  '-Wextra',
  '-Werror',
  '-Warray-bounds',
  '-mthumb',
  '-fstack-protector-strong'
]

if not cc.has_multi_arguments(comp_flags)
  error('unsupported compiler args')
else
  add_project_arguments(comp_flags, native: false, language: 'c')
endif

link_flags = [
  '-specs=nosys.specs',
  '-mcpu=cortex-m4',
  '-fno-common',
  '-mfloat-abi=hard',
  '-mfpu=fpv4-sp-d16',
  '-mthumb',
  '-Wl,--gc-sections',
  '-Wl,--defsym=__process_stack_size__=0x1000',
  '-Wl,--defsym=__main_stack_size__=0x400',
  #'-T'
]

if not cc.has_multi_link_arguments(link_flags)
  error('unsupported linker flags')
else
  add_project_link_arguments(link_flags, native: false, language: 'c')
endif

executable('demo_arm.elf', srcs)
