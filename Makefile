compile:
	nasm -f macho64 ./src/$(TARGET).asm && ld -e start -macos_version_min 10.13.0 -static -o ./src/$(TARGET) ./src/$(TARGET).o

run:
	make compile && ./src/$(TARGET)
