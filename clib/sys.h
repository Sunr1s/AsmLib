#include <stdint.h>

extern uint64_t c_fcreate(uint8_t * filename, uint16_t permissions);
extern void c_fdelete(uint8_t * filename, uint8_t mode);
extern uint64_t c_fopen(uint8_t * filename, uint8_t mode);
extern void c_fclose(uint64_t descriptor);
extern void c_fwrite(uint64_t descriptor, uint8_t * buffer, uint64_t size);
extern void c_fseek(uint64_t descriptor, uint8_t mode, uint64_t positioni);
extern uint64_t c_time(void);
extern void e_exit(void);
