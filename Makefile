xall:
	nasm -f bin boot.s -o myos.bin

run:
	qemu-system-i386 -drive format=raw,file=myos.bin

clean:
	rm -f myos.bin
