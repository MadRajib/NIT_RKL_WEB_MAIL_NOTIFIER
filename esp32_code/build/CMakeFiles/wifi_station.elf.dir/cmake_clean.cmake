file(REMOVE_RECURSE
  "bootloader/bootloader.bin"
  "bootloader/bootloader.elf"
  "bootloader/bootloader.map"
  "config/sdkconfig.cmake"
  "config/sdkconfig.h"
  "project_elf_src.c"
  "wifi_station.bin"
  "wifi_station.map"
  "CMakeFiles/wifi_station.elf.dir/project_elf_src.c.obj"
  "project_elf_src.c"
  "wifi_station.elf"
  "wifi_station.elf.pdb"
)

# Per-language clean rules from dependency scanning.
foreach(lang C)
  include(CMakeFiles/wifi_station.elf.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
