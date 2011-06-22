SUBDIRS = AccessControl

dist-hook:
	cp -R $(top_srcdir)/cppserver/AbstractClass/AccessControl $(distdir); \
	rm -rf `find $(distdir) -name .svn`
