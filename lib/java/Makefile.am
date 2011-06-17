# In the java directory we don't want to do anything, just
# make sure it is in the dist. Don't use EXTRA_DIST. It will copy
# the link instead of keeping them as links

javadir = $(datadir)/java
dist_java_DATA=\
   Astor-5.4.1.jar \
   DeviceTree-1.8.jar \
   ATKCore-4.2.10.jar \
   Jive-4.19.jar \
   org.tango.pogo-7.2.1.jar \
   atkpanel-4.3.jar \
   log4j-1.2.15.jar \
   AtkTuning-2.8.jar \
   LogViewer-1.2.3.jar \
   TangORB-7.4.3.jar \
   ATKWidget-4.2.10.jar \
   tool_panels-1.9.jar

if TANGO_JAVA_ENABLED
bin_SCRIPTS = \
   astor \
   jive \
   pogo \
   pogo-6 \
   devicetree \
   atkpanel \
   logviewer \
   atktuning \
   jdraw \
   synopticappli \
   atkmoni \
   tg_devtest \
   TangoVers \
   cvstag

edit = sed \
		-e 's|@SHELL[@]|$(SHELL)|g' \
		-e 's|@TANGO_RC_FILE[@]|$(TANGO_RC_FILE)|g' \
		-e 's|@JAVA[@]|$(JAVA)|g' \
		-e 's|@DOXYGEN[@]|$(DOXYGEN)|g' \
		-e 's|@prefix[@]|$(prefix)|g'
     
#astor jive pogo pogo-6 devicetree atkpanel logviewer atktuning jdraw synopticappli atkmoni cvstag TangoVers tg_devtest: Makefile
$(bin_SCRIPTS): Makefile
	rm -f $@ $@.tmp
	srcdir=''; \
	test -f ./$@.in || srcdir=$(srcdir)/; \
	$(edit) $${srcdir}$@.in >$@.tmp
     
	chmod +x $@.tmp
	chmod a-w $@.tmp
	mv $@.tmp $@


astor: $(srcdir)/astor.in
jive: $(srcdir)/jive.in
pogo: $(srcdir)/pogo.in
pogo-6: $(srcdir)/pogo-6.in
devicetree: $(srcdir)/devicetree.in
atkpanel: $(srcdir)/atkpanel.in
logviewer: $(srcdir)/logviewer.in
atktuning: $(srcdir)/atktuning.in
jdraw: $(srcdir)/jdraw.in
synopticappli: $(srcdir)/synopticappli.in
atkmoni: $(srcdir)/atkmoni.in
cvstag: $(srcdir)/cvstag.in
TangoVers: $(srcdir)/TangoVers.in
tg_devtest: $(srcdir)/tg_devtest.in

distclean-local: distclean-local-check
.PHONY: distclean-local-check
distclean-local-check:
	-rm -rf $(bin_SCRIPTS)
endif

# Make sure that all these go into the dist.
EXTRA_DIST = \
   astor.in \
   jive.in \
   pogo.in \
   pogo-6.in \
   devicetree.in \
   atkpanel.in \
   logviewer.in \
   atktuning.in \
   jdraw.in \
   synopticappli.in \
   atkmoni.in \
   cvstag.in \
   tg_devtest.in \
   TangoVers.in


# Even though we do not want to compile anything in the
# java-directory, we still want to install the sources in
# prefix/share/tango

install-data-hook:
	(cd  $(DESTDIR)$(javadir) ; \
	for i in $(dist_java_DATA) ; do \
	link_name=`echo $$i | @SED@ -e's/-[0-9.]*/./'` ; \
	$(RM) $$link_name && @LN_S@ $$i $$link_name ; \
	done \
	)

