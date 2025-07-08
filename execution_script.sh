#!/bin/bash

filename="${1%%.*}"
nasm -f elf64 ${filename}".s"
ld -o ${filename} ${filename}".o"
mv ${filename}.s  source_file/
mv ${filename}.o  object_file/
[ "$2" == "-g" ] && gdb - q ${filename} || ./${filename}



