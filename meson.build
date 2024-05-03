project('stm32 template',
  ['c'],
  meson_version: '>=0.53.0',
  default_options : ['warning_level=1', 'c_std=c11'])

arm_cc = meson.get_compiler('c', native: false)

comp_flags = [
  '-falign-functions=16',
  '-fmerge-all-constants',
  '-ffunction-sections',
  '-fdata-sections',
  '-fno-common',
  '-mcpu=cortex-m4',
  '-mfloat-abi=hard',
  '-mfpu=fpv4-sp-d16',
  '-Werror',
  '-Warray-bounds',
  '-mthumb',
  '-nostartfiles',
  '-fstack-protector-strong'
]

# source files
srclist = []
subdir('src')

# include files
incs = include_directories('inc')

# startup file
subdir('startup')

linker_script_flags = []
linker_script_deps = []

# linker file
subdir('linker')

# Linker options
link_flags = [
  '-nostdlib',
  '-specs=nosys.specs',
  '-mcpu=cortex-m4',
  '-fno-common',
  '-mfloat-abi=hard',
  '-mfpu=fpv4-sp-d16',
  '-mthumb',
  '-Wl,--gc-sections'
]

executable('demo_arm.elf', srclist,
  include_directories: incs,
  c_args: comp_flags,
  link_args: [
    link_flags,
    linker_script_flags
  ],
  link_depends: linker_script_deps,
  link_language: 'c',
  native: false)
