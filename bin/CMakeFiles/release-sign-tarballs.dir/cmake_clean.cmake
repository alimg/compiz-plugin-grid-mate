FILE(REMOVE_RECURSE
  "CMakeFiles/release-sign-tarballs"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/release-sign-tarballs.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
