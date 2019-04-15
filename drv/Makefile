SRC_ARCHIVE = can4linux-4.2.tgz
SRCDIR = can4linux_svn273
MODULE = can4linux.ko

all: $(MODULE)

$(MODULE): $(SRCDIR)
	cd $(SRCDIR); patch -p1 < ../pcm3680.c.patch
	cd $(SRCDIR); patch -p1 < ../0001-Revert-removed-a-lot-of-sparse-and-some-gcc-warnings.patch
	cd $(SRCDIR); patch -p1 < ../Makefile-standard-no-debug.patch
	make TARGET=PCM3680 -C $(SRCDIR)/can4linux
	cp $(SRCDIR)/can4linux/$(MODULE) .

$(SRCDIR):
	tar xf $(SRC_ARCHIVE)

install: $(MODULE)
	mkdir -p  $(DESTDIR)/lib/modules/$(shell uname -r)/extra
	cp $(MODULE) $(DESTDIR)/lib/modules/$(shell uname -r)/extra

clean:
	rm -rf $(SRCDIR)

mrproper: clean
	rm -f $(MODULE)
