# This is the name of your final file (without the extension)
EXEC_OUTPUT=output

# List all your source files here and generated .lis files
SOURCES = main.c nata.asm

# Set empty param to use classic lib
CLIB=-clib=sdcc_iy

# Set CRT
CRT=31

# You don't need to edit below here, have a happy coding.
MKDIR = mkdir -p
CC=zcc
AS=zcc
TARGET=+zx
VERBOSITY=-vn
OUT_DIR=build
PRAGMA_FILE=zpragma.inc
CREATE_SNA=-Cz"--sna"

OBJECTS=$(SOURCES:.*=.o)
OBJS=$(patsubst %, src/%, $(OBJECTS))

C_OPT_FLAGS=-SO3 --max-allocs-per-node200000 --opt-code-size

CFLAGS=$(TARGET) $(VERBOSITY) -c $(C_OPT_FLAGS) -compiler=sdcc $(CLIB) -pragma-include:$(PRAGMA_FILE)
LDFLAGS=$(TARGET) $(VERBOSITY) --list -m --c-code-in-asm $(CLIB) -pragma-include:$(PRAGMA_FILE) $(CREATE_SNA)
ASFLAGS=$(TARGET) $(VERBOSITY) --list -m -s -c

EXEC=$(OUT_DIR)/$(EXEC_OUTPUT).tap
MEM_FREE_SCRIPT=./scripts/memory_report.sh
JOIN_LIS_SCRIPT=./scripts/join_lis_files.sh

%.o: %.c $(PRAGMA_FILE)
	$(CC) $(CFLAGS) -o $@ $<

%.o: %.asm
	$(AS) $(ASFLAGS) -o $@ $<

# rule for building the project
all : clean dirs $(EXEC) join_lis report

# regla para compilar y crear el ejecutable
$(EXEC) : $(OBJS)
	$(CC) $(LDFLAGS) -startup=$(CRT) $(OBJS) -o $(OUT_DIR)/$(EXEC_OUTPUT) -create-app

# rule for creating the .tap file
.PHONY: install
install: all
	mv $(EXEC) bin

# rule for cleaning output files
.PHONY: clean
clean:
	rm -rf $(OUT_DIR) /tmp/tmpXX*
	rm -f *.tap *.bin *.map *.sym *.o *.lis ./src/*.c.lis

# rule for creating the output directory
.PHONY: dirs
dirs:
	$(MKDIR) $(OUT_DIR)

# rule for execute script for join lis files
.PHONY: join_lis
join_lis:
	sh $(JOIN_LIS_SCRIPT) ./src

# rule for execute script to show memory report
.PHONY: report
report:
	sh $(MEM_FREE_SCRIPT) ./$(OUT_DIR)/$(EXEC_OUTPUT).map



