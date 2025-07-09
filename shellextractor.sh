#!/bin/bash

for i in $(objdump -j .text -d $1 |grep "^ " |cut -f2); do echo -n $i; done; echo;
# can remove -j if u want other than specific .text section 
