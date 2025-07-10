#!/bin/bash

for i in $(objdump  -d $1 |grep "^ " |cut -f2); do echo -n $i; done; echo;
# can remove -j or use -j |  if u want other than specific .text section 
