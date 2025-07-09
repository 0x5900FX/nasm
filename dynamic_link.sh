#! /bin/bash

filename="${1%%.*}"
nasm -f elf64 "${filename}".s
ld "${filename}.o" -o "${filename}"  -lc --dynamic-linker   /lib64/ld-linux-x86-64.so.2
mv ${filename}.s  source_file/
mv ${filename}.o  object_file/
[ "$2" == "-g" ] && gdb - q ${filename} || ./${filename}
