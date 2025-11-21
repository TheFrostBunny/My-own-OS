GPPPARAMS = m32
ASPARAMS = --32
objects = loader.0 kernel.0
LDPARAMS = melf_i386

%. 0 %.cpp
	 g++ $(GPPPARAMS) -c $< -o $@
%. 0 %.s
	 as $(ASPARAMS) $< -o $@

mykernel.bin linker.ld &(objects)
	 ld &/LDPARAMS -T linker.ld -o &(objects)

install: mykernel.bin
	 sudo cp &< /boot/mykernel.bin