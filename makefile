C1541 = c1541
# Also pass symbols to VICE monitor
X64 = x64
OUTPUT = sw2020.prg
DISKFILENAME = sw2020.d64
DISKNAME = test
ID = 17

AS = acme
ASFLAGS = -f cbm

all: d64

sw2020:
	$(AS) $(ASFLAGS) -o $@.prg $@.acme
d64: sw2020
	$(C1541) -format $(DISKNAME),$(ID) d64 $(DISKFILENAME)
	$(C1541) -attach $(DISKFILENAME) -write $(OUTPUT)
	$(C1541) -attach $(DISKFILENAME) -list

run: d64
	$(X64) $(DISKFILENAME)

clean:
	rm -f $(DISKFILENAME) $(OUTPUT)
