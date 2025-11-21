void printf(char* str) {
    unsigned short* VideoMemory = (unsigned short*)0xb8000;

    for(int i = 0; str[i] != '\0'; i++) {
        VideoMemory[i] = (VideoMemory[i] & 0xFF00) | str[i];
    }
}


void kernalMain(void* multiboot_struct, unsigned int magicnumber) {
    printf("Kernal main function executed.\n");

    while(1);

}