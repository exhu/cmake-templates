cmake_minimum_required(VERSION 3.17)

# app template generation script
if(NOT PROJ_NAME OR NOT PROJ_PATH OR NOT PROJ_TYPE)
    message("Will create directory PROJ_PATH/PROJ_NAME and populate it with CMake and C files. Use lowercase C identifier for PROJ_NAME.")
    message(FATAL_ERROR "run as cmake -DPROJ_NAME=my_app -DPROJ_PATH=path_to_app_dir -DPROJ_TYPE=app|lib -P proj-template.cmake")
    return()
endif()

# setup variables, do checks

set(PROJ_DIR "${PROJ_PATH}/${PROJ_NAME}")
set(APP_DIR_NAME "unknown")

message(VERBOSE "PROJ_TYPE=${PROJ_TYPE}")
if(PROJ_TYPE STREQUAL "app")
    set(APP_DIR_NAME "app")
elseif(PROJ_TYPE STREQUAL "lib")
    set(APP_DIR_NAME "examples")
else()
    message(FATAL_ERROR "Specify PROJ_TYPE as 'app' or 'lib'")
endif()

get_filename_component(THIS_MODULE_DIR ${CMAKE_SCRIPT_MODE_FILE} DIRECTORY)
set(TEMPLATES_DIR "${THIS_MODULE_DIR}/templates")

message(VERBOSE "templates dir = ${TEMPLATES_DIR}")

if(EXISTS ${PROJ_DIR})
    message(FATAL_ERROR "Project directory already exists (${PROJ_DIR}).")
endif()

# do the job
message(VERBOSE "Creating ${PROJ_DIR}")
file(MAKE_DIRECTORY "${PROJ_DIR}")
configure_file("${TEMPLATES_DIR}/CMakeLists.txt.in" "${PROJ_DIR}/CMakeLists.txt" @ONLY)
file(MAKE_DIRECTORY "${PROJ_DIR}/build")
file(WRITE "${PROJ_DIR}/.gitignore" "build/\n")

# src, include dirs
configure_file("${TEMPLATES_DIR}/src/CMakeLists_${PROJ_TYPE}.txt.in" "${PROJ_DIR}/src/CMakeLists.txt" @ONLY)

configure_file("${TEMPLATES_DIR}/src/app_lib.c" "${PROJ_DIR}/src/${PROJ_NAME}.c" @ONLY)
configure_file("${TEMPLATES_DIR}/src/include/proj_name/app_lib.h" "${PROJ_DIR}/src/include/${PROJ_NAME}/${PROJ_NAME}.h" @ONLY)

# test dir
configure_file("${TEMPLATES_DIR}/test/CMakeLists.txt.in" "${PROJ_DIR}/test/CMakeLists.txt" @ONLY)
configure_file("${TEMPLATES_DIR}/test/test1.c" "${PROJ_DIR}/test/test1.c" @ONLY)
configure_file("${TEMPLATES_DIR}/test/test2.c" "${PROJ_DIR}/test/test2.c" @ONLY)

# app/examples dirs
configure_file("${TEMPLATES_DIR}/app/CMakeLists_${PROJ_TYPE}.txt.in" "${PROJ_DIR}/${APP_DIR_NAME}/CMakeLists.txt" @ONLY)
configure_file("${TEMPLATES_DIR}/app/main.c" "${PROJ_DIR}/${APP_DIR_NAME}/main.c" @ONLY)

message(STATUS "Finished.")