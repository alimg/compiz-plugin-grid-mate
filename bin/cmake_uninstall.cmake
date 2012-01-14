if (NOT EXISTS "/home/alim/dev/mategrid/bin/install_manifest.txt")
  message (FATAL_ERROR "Cannot find install manifest: \"/home/alim/dev/mategrid/bin/install_manifest.txt\"")
endif (NOT EXISTS "/home/alim/dev/mategrid/bin/install_manifest.txt")

file (READ "/home/alim/dev/mategrid/bin/install_manifest.txt" files)
string (REGEX REPLACE "\n" ";" files "${files}")
foreach (file ${files})
  message (STATUS "Uninstalling \"${file}\"")
  if (EXISTS "${file}")
    exec_program(
      "/usr/bin/cmake" ARGS "-E remove \"${file}\""
      OUTPUT_VARIABLE rm_out
      RETURN_VALUE rm_retval
      )
    if ("${rm_retval}" STREQUAL 0)
    else ("${rm_retval}" STREQUAL 0)
      message (FATAL_ERROR "Problem when removing \"${file}\"")
    endif ("${rm_retval}" STREQUAL 0)
  else (EXISTS "${file}")
    message (STATUS "File \"${file}\" does not exist.")
  endif (EXISTS "${file}")
endforeach (file)
