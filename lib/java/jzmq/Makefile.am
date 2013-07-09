
INCLUDES = $(LIBZMQ_CFLAGS)

JZMQ_CPP_FILES = \
	ZMQ.cpp \
	Context.cpp \
	Socket.cpp \
	Poller.cpp \
	util.cpp

JZMQ_H_FILES = \
	org_zeromq_ZMQ.h \
	org_zeromq_ZMQ_Error.h \
	org_zeromq_ZMQ_Context.h \
	org_zeromq_ZMQ_Socket.h \
	org_zeromq_ZMQ_Poller.h

JZMQ_HPP_FILES = jzmq.hpp \
				 util.hpp

JAVAH_FLAGS = -d . -classpath .

lib_LTLIBRARIES = libjzmq.la
libjzmq_la_SOURCES = $(JZMQ_CPP_FILES)

libjzmq_la_LIBADD = $(LIBZMQ_LIBS)

#nodist_libjzmq_la_SOURCES = \
#	$(JZMQ_H_FILES) \
#	$(JZMQ_HPP_FILES)

libjzmq_la_CXXFLAGS = -Wall @JNI_INCL_DIRS@


$(JZMQ_H_FILES):
	$(CLASSPATH_ENV) $(JAVAH) -jni -classpath . org.zeromq.ZMQ

$(srcdir)/ZMQ.cpp: \
	$(JZMQ_H_FILES) \
	$(JZMQ_HPP_FILES)

$(srcdir)/Context.cpp: \
	org_zeromq_ZMQ_Context.h \
	$(JZMQ_HPP_FILES)

$(srcdir)/Socket.cpp: \
	org_zeromq_ZMQ_Socket.h \
	$(JZMQ_HPP_FILES)

$(srcdir)/Poller.cpp: \
	org_zeromq_ZMQ_Poller.h \
	$(JZMQ_HPP_FILES)

$(srcdir)/util.cpp: \
	$(JZMQ_HPP_FILES)

EXTRA_DIST = $(JZMQ_H_FILES) \
			 $(JZMQ_HPP_FILES)


