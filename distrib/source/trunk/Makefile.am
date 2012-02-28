# This is the top-level Makefile

# The subdirs variable tells automake which subdirs should be
# traversed on a make.
#SUBDIRS = lib utils cppserver scripts doc
SUBDIRS = lib utils cppserver

if TANGO_JAVA_ENABLED
SUBDIRS += pogo
endif

ACLOCAL_AMFLAGS = -I m4

AUX_DIST = config/config.guess                         \
	   	   config/config.sub                           \
           config/install-sh                           \
           config/ltmain.sh                            \
           config/missing


AUX_DIST_EXTRA = m4/ac_cxx_have_strstream.m4       \
                 m4/ac_cxx_have_sstream.m4         \
                 m4/ac_cxx_have_class_strstream.m4 \
                 m4/ac_cxx_namespaces.m4           \
				 m4/RSSH_CHECK_OMNINOTIFY.m4	   \
                 m4/RSSH_CHECK_OMNIORB.m4          \
                 m4/RSSH_CHECK_SUNPRO_CC.m4        \
                 m4/RSSH_CHECK_PTHREADS.m4         \
                 m4/RSSH_ENABLE_PTHREADS.m4        \
                 m4/ac_path_mysqlclient.m4         \
                 m4/ac_prog_mysql.m4               \
                 m4/check_zlib.m4                  \
				 m4/gcc_release.m4				   \
				 m4/java_release.m4				   \
				 m4/mysql_release.m4			   \
				 m4/omniorb_release.m4			   \
	         	 m4/libtool.m4


EXTRA_DIST = bootstrap 			\
			 TANGO_CHANGES 		\
			 $(AUX_DIST) $(AUX_DIST_EXTRA)
 

MAINTAINERCLEANFILES = bootstrap Makefile.in aclocal.m4 configure $(AUX_DIST)


DISTCLEANFILES	= ac_config.h

