SUBDIRS = man

install-data-local:
	mkdir -p $(DESTDIR)/$(docdir)
	cp -r $(srcdir)/html $(DESTDIR)/$(docdir)/

uninstall-local:
	rm -rf $(DESTDIR)/$(docdir)/html

dist-hook:
	cp -r $(top_srcdir)/doc/html $(distdir)/
	cp -r $(top_srcdir)/doc/src $(distdir)/
