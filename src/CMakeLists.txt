# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

project(flutter_discord_rpc_fork_library VERSION 0.0.1 LANGUAGES C)

add_library(flutter_discord_rpc_fork SHARED
  "flutter_discord_rpc_fork.c"
)

set_target_properties(flutter_discord_rpc_fork PROPERTIES
  PUBLIC_HEADER flutter_discord_rpc_fork.h
  OUTPUT_NAME "flutter_discord_rpc_fork"
)

target_compile_definitions(flutter_discord_rpc_fork PUBLIC DART_SHARED_LIB)
