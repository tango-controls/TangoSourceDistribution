jarfile = zmq.jar
#jardir = $(datadir)/java

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

JZMQ_HPP_FILES = \
	util.hpp

JAVAH_FLAGS = -d . -classpath .

#$(jarfile):
#	$(JAVAC) -encoding utf8 -d . $(JZMQ_JAVA_FILES)
#	$(JAR) cf $(JARFLAGS) $@ org/zeromq/*.class

#jar_DATA = $(jarfile)

lib_LTLIBRARIES = libjzmq.la
libjzmq_la_SOURCES = $(JZMQ_CPP_FILES)

nodist_libjzmq_la_SOURCES = \
	$(JZMQ_H_FILES) \
	$(JZMQ_HPP_FILES)

libjzmq_la_CXXFLAGS = -Wall @JNI_INCL_DIRS@

#if DISABLE_VERSION
#libjzmq_la_LDFLAGS = -avoid-version
#else
#libjzmq_la_LDFLAGS = -version-info @JLTVER@
#endif

BUILT_SOURCES = \
	$(JZMQ_H_FILES)

CLEANFILES = \
	$(JZMQ_H_FILES) \
	$(jarfile)


#$(JZMQ_H_FILES): $(jarfile)
#	$(CLASSPATH_ENV) $(JAVAH) -jni -classpath . org.zeromq.ZMQ

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

dist-hook:
	-rm $(distdir)/*.h
