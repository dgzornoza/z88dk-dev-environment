# This is the name of your final file (without the extension)
EXEC_OUTPUT=output

# List all your source files here
SOURCES = main.c

# Maybe you'll need to edit this
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

CFLAGS=$(TARGET) $(VERBOSITY) -c $(C_OPT_FLAGS) -compiler sdcc -clib=sdcc_iy -pragma-include:$(PRAGMA_FILE)
LDFLAGS=$(TARGET) $(VERBOSITY) --list -m --c-code-in-asm -clib=sdcc_iy -pragma-include:$(PRAGMA_FILE) $(CREATE_SNA)
ASFLAGS=$(TARGET) $(VERBOSITY) --list -m -s -c

EXEC=$(OUT_DIR)/$(EXEC_OUTPUT).tap
MEM_FREE=./memory_report.sh

%.o: %.c $(PRAGMA_FILE)
	$(CC) $(CFLAGS) -o $@ $<

%.o: %.asm
	$(AS) $(ASFLAGS) -o $@ $<

all : clean dirs $(EXEC) report

$(EXEC) : $(OBJS)
	$(CC) $(LDFLAGS) -startup=$(CRT) $(OBJS) -o $(OUT_DIR)/$(EXEC_OUTPUT) -create-app

.PHONY: install
install: all
	mv $(EXEC) bin

.PHONY: clean
clean:
	rm -rf $(OUT_DIR) /tmp/tmpXX*
	rm -f *.tap *.bin *.map *.sym *.o *.lis ./src/*.c.lis

.PHONY: dirs 
dirs: 
	$(MKDIR) $(OUT_DIR)

.PHONY: report
report: 
	$(MEM_FREE) $(EXEC_OUTPUT)

