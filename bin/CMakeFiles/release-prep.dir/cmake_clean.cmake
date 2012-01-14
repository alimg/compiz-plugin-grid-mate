FILE(REMOVE_RECURSE
  "CMakeFiles/release-prep"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/release-prep.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
