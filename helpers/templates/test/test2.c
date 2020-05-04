#include "@PROJ_NAME@/@PROJ_NAME@.h"

#include <assert.h>
#include <stddef.h>

int main(int argc, char const *argv[])
{
    int ret = @PROJ_NAME@(1, NULL);
    assert(ret == 0);
    return 0;
}
