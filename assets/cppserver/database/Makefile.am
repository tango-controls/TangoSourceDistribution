AM_CPPFLAGS = $(ORB_INCLUDE_PREFIX)  $(LIBZMQ_CFLAGS) \
       -I$(top_srcdir)/lib/cpp/log4tango/include \
       -I$(top_builddir)/lib/cpp/log4tango/include \
       -I$(top_builddir)/lib/cpp/server \
       -I$(top_srcdir)/lib/cpp/client \
       -I$(top_srcdir)/lib/cpp/server \
       $(DB_CFLAGS) \
       $(ZLIB_CPPFLAGS)

AM_CXXFLAGS= -Wall -D_FORTIFY_SOURCE=2 -O1 -fPIE

LDADD = -L$(top_builddir)/lib/cpp/client -ltango -L$(top_builddir)/lib/cpp/log4tango/src \
        -llog4tango $(DB_LDFLAGS) \
         $(DB_LDLIBS) $(ZLIB_LDFLAGS) $(ZLIB_LIBS)  $(LIBZMQ_LIBS)

AM_LDFLAGS = -Wl,-z,now -pie

bin_PROGRAMS=DataBaseds

DataBaseds_SOURCES=ClassFactory.cpp          \
                   DataBaseClass.cpp         \
                   DataBase.cpp              \
                   DataBaseStateMachine.cpp  \
                   main.cpp                  \
                   update_starter.cpp        \
                   DataBaseUtils.cpp         \
                   DataBase.h                \
                   DataBaseClass.h           \
                   update_starter.h

if TANGO_DB_CREATE_ENABLED

dbdir=${pkgdatadir}/db
db_DATA=create_db.sh create_db.sql create_db_tables.sql stored_proc.sql update_db.sh update_db.sql update_db8.sql update_db7.sql rem_history.sql

## This is to make sure that the create-db script is run on each make all.
## See create_db.sh for more information.
all-local: .force
	$(SHELL) ${top_builddir}/cppserver/database/create_db.sh < ${top_builddir}/cppserver/database/create_db.sql

endif

EXTRA_DIST    = create_db.sh.in create_db.sql.in create_db_tables.sql.in stored_proc.sql.in \
                update_db.sh.in update_db8.sql.in update_db7.sql.in update_db.sql.in rem_history.sql.in

.force:

