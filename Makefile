INSTALL ?= install
HELP2MAN ?= help2man

PREFIX  ?= /usr/local
BINDIR  ?= $(PREFIX)/bin
MANDIR ?= $(PREFIX)/share/man

COMPRESSDOC := src/compressdoc
COMPRESSDOC.1 := doc/compressdoc.1

all:
	$(HELP2MAN) $(COMPRESSDOC) -o $(COMPRESSDOC.1)

install: all
	$(INSTALL) -Dm755 $(COMPRESSDOC) $(DESTDIR)$(BINDIR)/compressdoc
	$(INSTALL) -Dm644 $(COMPRESSDOC.1) $(DESTDIR)$(MANDIR)/man1/compressdoc.1

uninstall:
	rm -r $(DESTDIR)$(BINDIR)/compressdoc

clean:
	rm -r $(COMPRESSDOC.1)

.PHONY: all clean install
