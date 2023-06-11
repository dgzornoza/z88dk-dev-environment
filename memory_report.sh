#!/bin/sh

CODE_SIZE=$(perl -ne '/^__code_compiler_size\s+=\s+\$(\w+)/ && print hex($1)' < ./build/$1.map)

echo -n "Compiled code size is         "
printf "%5d  " $CODE_SIZE
printf "(0x%04X) bytes\n" $CODE_SIZE

DATA_SIZE=$(perl -ne '/^__data_compiler_size\s+=\s+\$(\w+)/ && print hex($1)' < ./build/$1.map)

echo -n "Compiled data size is         "
printf "%5d  " $DATA_SIZE
printf "(0x%04X) bytes\n" $DATA_SIZE

RODATA_USER_SIZE=$(perl -ne '/^__rodata_user_size\s+=\s+\$(\w+)/ && print hex($1)' < ./build/$1.map)

echo -n "Read only user data size is   "
printf "%5d  " $RODATA_USER_SIZE
printf "(0x%04X) bytes\n" $RODATA_USER_SIZE


REG_SP=$(perl -ne '/^__register_sp\s+=\s+\$(\w+)/ && print hex($1)' < ./build/$1.map)
BSS_END=$(perl -ne '/^__BSS_END_tail\s+=\s+\$(\w+)/ && print hex($1)' < ./build/$1.map)
STACK_SIZE=$(perl -ne '/^TAR__crt_stack_size\s+=\s+\$(\w+)/ && print hex($1)' < ./build/$1.map)

TOP_STACK=$(expr $REG_SP - $STACK_SIZE)
FREE_MEM=$(expr $TOP_STACK - $BSS_END)

echo -n "\nStack comes down to         "
printf "%5d  " $TOP_STACK
printf "(0x%04X)\n" $TOP_STACK

echo -n "Heap starts at                "
printf "%5d  " $BSS_END
printf "(0x%04X)\n" $BSS_END

echo "                              ====="
echo -n "Free memory                   "
printf "%5d  " $FREE_MEM
printf "(0x%04X)\n" $FREE_MEM
