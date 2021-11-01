#!/usr/bin/env -S make -f

INSTALL ?= install
HELP2MAN ?= help2man

PREFIX  ?= /usr/local
BINDIR  ?= $(PREFIX)/bin
MANDIR ?= $(PREFIX)/share/man

COMPRESSDOC := src/compressdoc
COMPRESSDOC.1 := doc/compressdoc.1

# Read the version string from compressdoc
VERSION = $(shell grep ^VERSION $(COMPRESSDOC) | cut -d '=' -f 2)

all:
	$(HELP2MAN) --name "compress documentation in a directory and update symlinks" \
							--section 1 \
							--no-info \
							--version-string $(VERSION) \
							$(COMPRESSDOC) -o $(COMPRESSDOC.1)

install: all
	$(INSTALL) -Dm755 $(COMPRESSDOC) $(DESTDIR)$(BINDIR)/compressdoc
	$(INSTALL) -Dm644 $(COMPRESSDOC.1) $(DESTDIR)$(MANDIR)/man1/compressdoc.1

uninstall:
	rm $(DESTDIR)$(BINDIR)/compressdoc

clean:
	rm $(COMPRESSDOC.1)

.PHONY: all clean install
