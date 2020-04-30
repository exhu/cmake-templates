# cmake-templates
Common cmake templates and helper scripts.

## Project structure
Do not make complicated hierarchies, CMakeLists.txt root file must list
all project code and external dependencies via add_subdirectory() and
find_package().

app - sources of application executable binaries, or utils (for a lib. project)

assets - put static program resources here.

build - folder for *cmake output*

cmake - put custom cmake modules here (macros, functions etc.)

doc - put documentation here.

examples - example applications for a library project.

external - put external sources (dependencies) here. 

extern-bin - put external binaries here.

include/libname - public headers (for a lib. project).

src - put main program logic sources here, should produce a static library,
which is used by executables and tests.

test - put unit, integration, regression tests here.

## simple_app
Sample executable project.

## simple_lib
Sample library project.


## References
https://cliutils.gitlab.io/modern-cmake/chapters/basics/structure.html
https://gitlab.com/CLIUtils/modern-cmake/-/tree/master/examples/extended-project
