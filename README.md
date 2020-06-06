# cmake-templates
Common cmake templates and helper scripts.

## Project structure
Do not make complicated hierarchies, CMakeLists.txt root file must list
all project code and external dependencies via add_subdirectory() and
find_package().

apps - sources of application executable binaries, or utils (for a lib. project)

assets - put static program resources here.

build - folder for *cmake output*

cmake - put custom cmake modules here (macros, functions etc.)

doc - put documentation here.

examples - example applications for a library project.

external - put external sources (dependencies) here. 

extern-bin - put external binaries here.

src/include/libname - public headers (for a lib. project).

src - put main program logic sources here, should produce a static library,
which is used by executables and tests.

tests - put unit, integration, regression tests here.

## simple_app
Sample executable project for illustration. Use the provided script below, to
generate a new library or app project.

## helpers/proj-template.cmake
A standalone cmake script to generate cmake and c files for a new project.
Run as cmake -DPROJ_NAME=my_proj_name -DPROJ_PATH=path_to_app_dir -DPROJ_TYPE=app|lib -P proj-template.cmake

The new project will be created in directory "path_to_app_dir/my_proj_name".

TODO: add versioning support, config header generation with version info.

## References
https://cliutils.gitlab.io/modern-cmake/chapters/basics/structure.html

https://gitlab.com/CLIUtils/modern-cmake/-/tree/master/examples/extended-project
