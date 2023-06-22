#!/bin/sh

# REMARKS: this file should be in LF, if is in CLRF end line can't execute witth errors ": not foundport.sh: line XX"

echo ""
echo "---------- REPORT -------------"

CODE_SIZE=$(perl -ne '/^__code_compiler_size\s+=\s+\$(\w+)/ && print hex($1)' < $1)

printf "\nCompiled code size is         %5d  " $CODE_SIZE
printf "(0x%04X) bytes\n" $CODE_SIZE

DATA_SIZE=$(perl -ne '/^__data_compiler_size\s+=\s+\$(\w+)/ && print hex($1)' < $1)

printf "Compiled data size is         %5d  " $DATA_SIZE
printf "(0x%04X) bytes\n" $DATA_SIZE

RODATA_USER_SIZE=$(perl -ne '/^__rodata_user_size\s+=\s+\$(\w+)/ && print hex($1)' < $1)

printf "Read only user data size is   %5d  " $RODATA_USER_SIZE
printf "(0x%04X) bytes\n" $RODATA_USER_SIZE


REG_SP=$(perl -ne '/^__register_sp\s+=\s+\$(\w+)/ && print hex($1)' < $1)
BSS_END=$(perl -ne '/^__BSS_END_tail\s+=\s+\$(\w+)/ && print hex($1)' < $1)
STACK_SIZE=$(perl -ne '/^TAR__crt_stack_size\s+=\s+\$(\w+)/ && print hex($1)' < $1)

TOP_STACK=$(expr $REG_SP - $STACK_SIZE)
FREE_MEM=$(expr $TOP_STACK - $BSS_END)

printf "Stack comes down to           %5d  " $TOP_STACK
printf "(0x%04X)\n" $TOP_STACK

printf "Heap starts at                %5d  " $BSS_END
printf "(0x%04X)\n" $BSS_END

echo "                              ====="
printf "Free memory                   %5d " $FREE_MEM
printf "(0x%04X) bytes\n\n" $FREE_MEM
