edit = sed \
   -e 's|@bindir[@]|$(bindir)|g' \
   -e 's|@datadir[@]|$(datadir)|g' \
   -e 's|@prefix[@]|$(prefix)|g' \
   -e 's|@ORB_PREFIX[@]|$(ORB_PREFIX)|g'

preferencesdir   		= $(datadir)/pogo/preferences

dist_preferences_DATA 	= common_target.opt 

nodist_preferences_DATA   = Pogo.site_properties \
				 tango.opt


$(nodist_preferences_DATA): Makefile
	rm -f $@ $@.tmp
	srcdir=''; \
	test -f ./$@.in || srcdir=$(srcdir)/; \
	$(edit) $${srcdir}$@.in >$@.tmp
	chmod a-w $@.tmp
	mv $@.tmp $@

CLEANFILES = $(nodist_preferences_DATA)
Pogo.site_properties: $(srcdir)/Pogo.site_properties.in
tango.opt: $(srcdir)/tango.opt.in

EXTRA_DIST = \
   Pogo.site_properties.in \
   tango.opt.in
