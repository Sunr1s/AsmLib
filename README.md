# AsmLib 
My first little lib in asm. I just wanna top up my masm knowless level and start learning FASM assembler. This is C-orintable lib. All function - analogs famos and classic clib like stdio.h , string.h , etc.

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
  
+ mth (simple math pack)
  +  void c_srand(uint64_t num);
  +  uint64_t c_rand(void);
  +  void c_bubble_sort(uint8_t * buffer, uint64_t size);
  +  uint64_t c_gcd(uint64_t x, uint64_t y);
  +  uint64_t c_fibonacci(uint64_t num);
  +  uint64_t c_factorial(uint64_t num);
  
+ str (string helper pack)
  + uint64_t c_string_to_number(uint8_t * str);
  + void c_number_to_string(uint64_t num, uint8_t * buffer, uint8_t size);
  + uint64_t c_lenght_string(uint8_t * str);
  
+ sys (system and file editor pack)
  + uint64_t c_fcreate(uint8_t * filename, uint16_t permissions);
  + void c_fdelete(uint8_t * filename, uint8_t mode);
  + uint64_t c_fopen(uint8_t * filename, uint8_t mode);
  + void c_fclose(uint64_t descriptor);
  + void c_fwrite(uint64_t descriptor, uint8_t * buffer, uint64_t size);
  + void c_fseek(uint64_t descriptor, uint8_t mode, uint64_t positioni);
  + uint64_t c_time(void);
  + void e_exit(void);
