#!/bin/bash

filename="${1%%.*}"
nasm -f elf64 ${filename}".s"
ld -o ${filename} ${filename}".o"
[ "$2" == "-g" ] && gdb - q ${filename} || ./${filename}



