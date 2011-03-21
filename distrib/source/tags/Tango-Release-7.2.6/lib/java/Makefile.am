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
   cvstag

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
   cvstag.in


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

