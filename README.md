# AsmLib 
My first little lib in asm. I just wanna top up my masm knowless level and start learning FASM assembler. This is C-orintable lib.
Have same package with functions: 
+ fmt (input/output data handler)
  +  uint8_t c_input_char (void);
  +  uint64_t c_input_number(void);
  +  uint64_t c_input_string(uint8_t * str, uint64_t size);
  +  uint8_t c_print_bytes(uint8_t * str, uint64_t size);
  +  void c_printf(uint8_t * str, ...);
  +  void c_print_hex(uint64_t num);
  +  void c_print_oct(uint64_t num);
  +  void c_print_bin(uint64_t num);
  +  uint8_t c_print_number(uint64_t num);
  +  void c_print_char(uint8_t ch);
  +  void c_print_string(uint8_t * str);
  +  void c_print_line(void);
+ mth (simple math functions)
  +  void c_srand(uint64_t num);
  +  uint64_t c_rand(void);
  +  void c_bubble_sort(uint8_t * buffer, uint64_t size);
  +  uint64_t c_gcd(uint64_t x, uint64_t y);
  +  uint64_t c_fibonacci(uint64_t num);
  +  uint64_t c_factorial(uint64_t num);
  
