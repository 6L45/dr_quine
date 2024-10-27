nasm -f elf64 -lc colleen.s
gcc -no-pie -o colleen colleen.o
