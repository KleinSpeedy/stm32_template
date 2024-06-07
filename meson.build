project('stm32_template',
  ['c'],
  meson_version: '>=0.53.0',
  default_options : ['warning_level=2', 'c_std=c11'])

arm_cc = meson.get_compiler('c', native: false)

comp_flags = [
  '-mcpu=cortex-m4',
  '-mfloat-abi=hard',
  '-mfpu=fpv4-sp-d16',
  '-Werror',
  '-Warray-bounds',
  '-mthumb',
  '-masm-syntax-unified',
  '-falign-functions=16',
  '-fmerge-all-constants',
  '-ffunction-sections',
  '-fdata-sections',
  '-fno-common'
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
  '-nostartfiles',
  '--specs=nosys.specs',
  '-mcpu=cortex-m4',
  '-fno-common',
  '-mfloat-abi=hard',
  '-mfpu=fpv4-sp-d16',
  '-mthumb',
  '-Wl,--gc-sections'
]

# Configure external dependencies
subdir('ext')

target_suffix = '.elf'

# Release target
build_target(meson.project_name() + '_rls' + target_suffix,
  srclist,
  include_directories: incs,
  c_args: comp_flags,
  link_args: [
    link_flags,
    linker_script_flags
  ],
  link_depends: linker_script_deps,
  link_language: 'c',
  override_options: [
    'optimization=s',
    'debug=false'
  ],
target_type: 'executable')

# Debug target
build_target(meson.project_name() + '_dbg' + target_suffix,
  srclist,
  include_directories: incs,
  c_args: comp_flags,
  link_args: [
    link_flags,
    linker_script_flags
  ],
  link_depends: linker_script_deps,
  link_language: 'c',
  override_options: [
    'buildtype=debug'
  ],
target_type: 'executable')
