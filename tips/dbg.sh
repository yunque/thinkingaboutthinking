# Find the ARM GCC toolchain directory
locate arm-none-eabi-gcc
# e.g. @ /home/imr/ti/ccsv6/tools/compiler/gcc-arm-none-eabi-4_8-2014q3/arm-none-eabi/

# Location of assembler (as), linker(ld), etc.
/usr/arm-linux-gnueabi/bin




# GDB
# basix @ http://www.thegeekstuff.com/2010/03/debug-c-program-using-gdb/
# 1. Call a program with $ "gdb /path/to/program.c"
# 2. Set breakpoints
# 3. Run program with command line arguments w/ $ "run -m /path/to/model.bsm" etc

# step into
s

# next
n

# set breakpoint
b filename.ext:line#

# delete breakpoint, cf. http://www.delorie.com/gnu/docs/gdb/gdb_32.html
clear filename.ext:line#

# print variable value
p VAR

# examine contents of address
x 0x7FFFFFF

# show current breakpoints
info breakpoints




# Segmentation fault diagnosis
valgrind <cmd_that_segfaults>
valgrind --leak-check=full <cmd_that_segfaults>

# Heap memory usage
valgrind -massif
