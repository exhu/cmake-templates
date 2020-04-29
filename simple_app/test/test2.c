#include "simple_app_lib.h"

#include <assert.h>
#include <stddef.h>

int main(int argc, char const *argv[])
{
    int ret = simple_app(1, NULL);
    assert(ret == 0);
    return 0;
}
