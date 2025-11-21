# Compiler and assembler settings
GPPPARAMS = -m32                # Parameters for the g++ compiler
ASPARAMS = --32                 # Parameters for the assembler
objects = loader.o kernel.o      # List of object files to build
LDPARAMS = -melf_i386           # Linker parameters for 32-bit ELF

# Rule for compiling C++ source files into object files
%.o: %.cpp
	 g++ $(GPPPARAMS) -c $< -o $@

# Rule for compiling assembly source files into object files
%.o: %.s
	 as $(ASPARAMS) $< -o $@

# Linker rule to create the kernel binary
mykernel.bin: linker.ld $(objects)
	 ld $(LDPARAMS) -T linker.ld -o $@ $(objects)

# Install rule to copy the binary to /boot
install: mykernel.bin
	 sudo cp mykernel.bin /boot/mykernel.bin
