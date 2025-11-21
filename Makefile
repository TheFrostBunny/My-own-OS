# Compiler and assembler settings
GPPPARAMS = -m32
ASPARAMS = --32
objects = loader.o kernel.o
LDPARAMS = -melf_i386

# Rules for compiling C++ and assembly files
%.o: %.cpp
	 g++ $(GPPPARAMS) -c $< -o $@

%.o: %.s
	 as $(ASPARAMS) $< -o $@

# Linker rule to create the kernel binary
mykernel.bin: linker.ld $(objects)
	 ld $(LDPARAMS) -T linker.ld -o $@ $(objects)

# Install rule to copy the binary to /boot
install: mykernel.bin
	 sudo cp $< /boot/mykernel.bin
