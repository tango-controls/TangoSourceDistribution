
AM_CPPFLAGS = -I$(top_srcdir)/lib/cpp/client \
	   -I$(top_srcdir)/lib/cpp/server $(ORB_INCLUDE_PREFIX) \
           -I$(top_srcdir)/lib/cpp/log4tango/include \
           -I$(top_builddir)/lib/cpp/server \
           -I$(top_builddir)/lib/cpp/log4tango/include  $(LIBZMQ_CFLAGS)

LDADD = -L$(top_builddir)/lib/cpp/client -ltango \
        -L$(top_builddir)/lib/cpp/log4tango/src -llog4tango \
 		$(LIBZMQ_LIBS)

bin_PROGRAMS=TangoTest

TangoTest_SOURCES=ClassFactory.cpp     		\
                  TangoTestClass.cpp  	 	\
                  TangoTest.cpp 		\
                  TangoTestStateMachine.cpp 	\
                  main.cpp           

tangoincludedir = $(includedir)/tango

tangoinclude_HEADERS = TangoTestClass.h	\
				  TangoTest.h
