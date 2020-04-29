#include "simple_app_lib.h"

#include <assert.h>

int main(int argc, char const *argv[])
{
    const char *test_argv[] = {"simple_app"};
    int ret = simple_app(1, test_argv);
    assert(ret == 0);
    return 0;
}
