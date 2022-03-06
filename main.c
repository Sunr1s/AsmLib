#include "clib/fmt.h"
#include "clib/mth.h"
#include "clib/str.h"
#include "clib/sys.h"

int main(void){
	uint64_t num = "wdc.txt";
	uint64_t desc =c_fcreate(num, 0777);
	c_fwrite(desc, "[hello, world!]", 15);
	c_fclose(desc);
	c_printf("%d",num);
	return 0;
}
