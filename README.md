# AsmLib 
My first little lib in asm. I just wanna top up my masm knowless level and start learning FASM assembler. This is C-orintable lib.
Have same package with functions: 
+ fmt
  + extern uint8_t c_input_char (void);
  + extern uint64_t c_input_number(void);
  + extern uint64_t c_input_string(uint8_t * str, uint64_t size);
  + extern uint8_t c_print_bytes(uint8_t * str, uint64_t size);
  + extern void c_printf(uint8_t * str, ...);
  + extern void c_print_hex(uint64_t num);
  + extern void c_print_oct(uint64_t num);
  + extern void c_print_bin(uint64_t num);
  + extern uint8_t c_print_number(uint64_t num);
  + extern void c_print_char(uint8_t ch);
  + extern void c_print_string(uint8_t * str);
  + extern void c_print_line(void);
