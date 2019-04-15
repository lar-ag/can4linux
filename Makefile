all: drv

drv:
	make -C drv

install:
	install -D -m 755 -o root -g root cansetup $(DESTDIR)/usr/sbin/cansetup
	install -D -m 644 -o root -g root cansetup.conf $(DESTDIR)/etc/init/cansetup.conf
	install -D -m 644 -o root -g root can.conf $(DESTDIR)/etc/can.conf
	make DESTDIR=$(DESTDIR) -C drv install
