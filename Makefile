SRCS := $(filter-out Makefile README.txt %.dat,$(wildcard *))
DATS := $(patsubst %,%.dat,$(SRCS))

.PHONY: all
all: $(DATS)

.PHONY: debug
debug:
	@echo "srcs: " $(SRCS)
	@echo "dats: " $(DATS)

%.dat: %
	strfile -c % $< $@

clean:
	rm -f *.dat
