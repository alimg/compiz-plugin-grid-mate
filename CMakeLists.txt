find_package (Compiz REQUIRED)

include (CompizPlugin)

compiz_plugin(mategrid PLUGINDEPS composite opengl)
