SRCS := $(filter-out Makefile README.txt %.dat,$(wildcard *))
DATS := $(patsubst %,%.dat,$(SRCS))
JUNK := $(filter-out $(DATS),$(wildcard *.dat))

.PHONY: all
all: $(DATS)

.PHONY: debug
debug:
	$(info srcs: $(SRCS))
	$(info dats: $(DATS))
	$(info junk: $(JUNK))

%.dat: %
	strfile -c % $< $@

# Remove dat files that don't have a corresponding src file
.PHONY: tidy
tidy:
ifneq ($(JUNK),)
	rm $(JUNK)
endif

# Remove all dat files
.PHONY: clean
clean:
	rm -f *.dat
