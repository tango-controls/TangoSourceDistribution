
AM_CPPFLAGS = -I$(top_srcdir)/lib/cpp/server \
	   -I$(top_srcdir)/lib/cpp/client \
	   $(ORB_INCLUDE_PREFIX) \
           -I$(top_srcdir)/lib/cpp/log4tango/include \
           -I$(top_builddir)/lib/cpp/server \
           -I$(top_builddir)/lib/cpp/log4tango/include $(LIBZMQ_CFLAGS)

LDADD = -L$(top_builddir)/lib/cpp/client -ltango \
        -L$(top_builddir)/lib/cpp/log4tango/src -llog4tango \
		$(LIBZMQ_LIBS)

bin_PROGRAMS=Starter

Starter_SOURCES=ClassFactory.cpp   		\
				Starter.cpp        		\
                StarterClass.cpp   		\
                StarterUtil.cpp    		\
				StarterStateMachine.cpp \
                main.cpp  				\
				PingThread.cpp 			\
				StartProcessThread.cpp 	\
				CheckProcessUtil.cpp	\
				CheckProcessUtil.h		\
				PingThread.h 			\
		  		StarterClass.h  		\
		  		Starter.h				\
				StarterUtil.h

