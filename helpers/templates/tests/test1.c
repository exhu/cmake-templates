#include "@PROJ_NAME@/@PROJ_NAME@.h"

#include <assert.h>

int main(int argc, char const *argv[])
{
    const char *test_argv[] = {"simple_app"};
    int ret = @PROJ_NAME@(1, test_argv);
    assert(ret == 0);
    return 0;
}
