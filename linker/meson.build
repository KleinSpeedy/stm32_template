# linker file setup

fsmod = import('fs')

plat = meson.get_cross_property('platform', '')
if plat == ''
  error('platform not specified')
endif

linker_file = plat + '.ld'

if not fsmod.is_file(linker_file)
  error('Could not find linker file')
endif

linker_script_flags += '-L' + meson.current_source_dir()
linker_script_flags += '-T' + linker_file
linker_script_deps += files(linker_file)
