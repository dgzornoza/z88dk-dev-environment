#!/bin/sh

source_dir=$1

echo "$source_dir"
# Main lis file is ended with *.c.lis (c compilation generate this file)
c_lis_file=$(find $source_dir -type f -name "*.c.lis")

# Verify
if [ -z "$c_lis_file" ]; then
  echo "Not found *.c.lis file"
  exit 1
fi

# concat all .asm.lis files to the .c.lis file
find . -type f -name "*.asm.lis" -exec cat {} + >> "$c_lis_file"
echo "All partial .asm.lis joined in $c_lis_file"

# remove partial .asm.lis files
find $source_dir -type f -name '*.asm.lis' ! -name $c_lis_file -exec rm {} +
echo "Deleted all partial .asm.lis files"




