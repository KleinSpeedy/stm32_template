project('stm32_template',
  ['c'],
  meson_version: '>=0.53.0',
  default_options : ['warning_level=2', 'c_std=c11'])

comp_flags = [
  '-mcpu=cortex-m4',
  '-mfloat-abi=hard',
  '-mfpu=fpv4-sp-d16',
  '-Werror',
  '-Warray-bounds',
  '-mthumb',
  '-fno-common',
  '-fno-lto'
]

# source files
srclist = []
subdir('src')

# include files, use array
incs = []
incs += include_directories('inc')

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
  '-fno-common',
  '-mcpu=cortex-m4',
  '-mfloat-abi=hard',
  '-mfpu=fpv4-sp-d16',
  '-mthumb',
  '-Wl,--gc-sections',
  '-Wl,-Map=output.map'
]

# Compiler definitions
defs = [
  '-DSTM32F429xx'
]

# Add all external sources from STM32Cube to project
stm32_cube_srcs = []

# Configure external dependencies
subdir('ext')

target_suffix = '.elf'

# Release target
build_target(meson.project_name() + '_rls' + target_suffix,
  [srclist,
    stm32_cube_srcs,
  ],
  include_directories: incs,
  c_args: [ comp_flags, defs ],
  link_args: [
    link_flags,
    linker_script_flags,
    defs
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
  [srclist,
    stm32_cube_srcs,
  ],
  include_directories: incs,
  c_args: [ comp_flags, defs ],
  link_args: [
    link_flags,
    linker_script_flags,
    defs
  ],
  link_depends: linker_script_deps,
  link_language: 'c',
  override_options: [
    'buildtype=debug'
  ],
target_type: 'executable')
