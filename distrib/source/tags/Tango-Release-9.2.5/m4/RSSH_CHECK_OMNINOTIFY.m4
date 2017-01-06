dnl@synposis RSSH_CHECK_CORBA_NOTIFICATION_SERVICE
dnl
dnl set CORBA support for omniORB v3-pr2 or highter
dnl    ( http://www.uk.research.att.com/omniORB/omniORB.html)
dnl
dnl@author  Emmanuel Taurel 2003
dnl@id $Id$
dnl
AC_DEFUN([RSSH_CHECK_OMNINOTIFY],[
AC_REQUIRE([AC_PROG_CC])dnl
AC_REQUIRE([AC_PROG_CXX])dnl
AC_REQUIRE([AC_PROG_CPP])dnl
AC_REQUIRE([AC_PROG_CXXCPP])dnl
AC_REQUIRE([RSSH_CHECK_OMNIORB])dnl


AC_ARG_WITH(omninotify, AC_HELP_STRING([--with-omniNotify],[prefix to omniNotify installation (default: $OMNI_ROOT)]) ,\
            OMNINOTIFY_PREFIX=${with_omninotify} , OMNINOTIFY_PREFIX=/usr/local )

if test "x$OMNI_ROOT" = "x"
then
 if test "x$OMNINOTIFY_PREFIX" = "x"
 then
   OMNI_ROOT="/usr/local"
 else
   OMNI_ROOT="$OMNINOTIFY_PREFIX"
 fi
fi

if  test "x$OMNINOTIFY_PREFIX" = "xno"
then
dnl OMNINOTIFY NOT SET 
  AC_MSG_RESULT(omniNotify is disabled)
  omninotify=no
else

AC_LANG_SAVE
AC_LANG_CPLUSPLUS

svCXXCPPFLAGS=$CXXCPPFLAGS
svCXXFLAGS=$CXXFLAGS
svCPPFLAGS=$CPPFLAGS
svLIBS=$LIBS
svLDFLAGS=$LDFLAGS
svRSSH_ROLLBACK=$rssh_rollback
rssh_rollback="true"

ORB_INCLUDES="-I$OMNI_ROOT/include"
CXXCPPFLAGS="$CXXCPPFLAGS -I$OMNI_ROOT/include "
CPPFLAGS="$CPPFLAGS -I$OMNI_ROOT/include "

RSSH_ENABLE_PTHREADS

case $build_cpu in
 sparc*)
    AC_DEFINE(__sparc__,1,Needed by omniorb)
    IDLCXXFLAGS="$IDLCXXFLAGS -D__sparc__"
    ;;
 "i686"|"i586"|"i486"|"i386")
    AC_DEFINE(__x86__,1,Needed by omniorb")
    IDLCXXFLAGS="$IDLCXXFLAGS -D__x86__"
    ;;
esac
case $build_os in
 solaris*)
    AC_DEFINE(__sunos__,1,If we're running on solaris)
    IDLCXXFLAGS="$IDLCXXFLAGS -D__sunos__"
    __OSVERSION__=5
    AC_DEFINE_UNQUOTED(__OSVERSION__, $__OSVERSION__,Needed by omniorb)
    IDLCXXFLAGS="$IDLCXXFLAGS -D__OSVERSION__=5"
    ;;
 freebsd*)
    AC_DEFINE(__freebsd__,1,If we're running on freebsd)
    IDLCXXFLAGS="$IDLCXXFLAGS -D__freebsd__"
    ;;
esac

AC_SUBST(IDLCXXFLAGS)

CXXCPPFLAGS="$CXXCPPFLAGS $IDLCXXFLAGS"

AC_CHECK_HEADER( omniNotify/omniNotify.h, omninotify=yes , omninotify=no, )

if test "x$omninotify" = "xyes" 
then
  OMNI_LIBDIR="$OMNI_ROOT/lib"
  if test ! -r "$ORB_LIBDIR/libCOSNotify4.so"
  then
    for i in $OMNI_ROOT/lib/*/lib*.so
    do
      OMNI_LIBDIR=`dirname $i` 
      break;
    done
  fi

  LIBS="$LIBS -lomnithread"
  svLIBS=$LIBS
  LIBS="-L$OMNI_LIBDIR $LIBS"

  AC_CACHE_CHECK([for omnithreads],
    rssh_cv_check_omnithreads,
    rssh_enable_pthreads_done=""
    RSSH_ENABLE_PTHREADS
    AC_LANG_SAVE
    AC_LANG_CPLUSPLUS
    AC_TRY_LINK(
#include <omnithread.h>
,omni_mutex my_mutex,
                 rssh_cv_check_omnithreads=yes,rssh_cv_check_omnithreads=no)
    AC_LANG_RESTORE
  )
  if  test ! $rssh_cv_check_omnithreads = yes
  then
    AC_MSG_RESULT("omnithreads not found")
    omninotify_lib=no
  fi
  AC_CHECK_LIB(socket,socket, LIBS="-lsocket $LIBS",,)
  AC_CHECK_LIB(nsl,gethostbyname, LIBS="-lnsl $LIBS",,)

  OMNI_LDFLAGS="-L$OMNI_LIBDIR"
  LIBS="$OMNI_LDFLAGS -lomniORB4 -lomniDynamic4 $svLIBS $LIBS"
  AC_CACHE_CHECK([whether we can link with omniNotify],
    rssh_cv_check_omniNotifylib,
    AC_TRY_LINK(
#include <omniNotify/omniNotify.h>
,CosNotifyChannelAdmin::EventChannelFactory_var eventChannelFactory,
    rssh_cv_check_omniNotifylib=yes,rssh_cv_check_omniNotifylib=no
    )
  )

  if  test ! $rssh_cv_check_omniNotifylib = yes
  then
    AC_MSG_RESULT("omniNotify libs not found")
    omninotify_lib=no
  fi


  OMNI_LIBS="$OMNI_LDFLAGS -lomniORB4 -lomnithread"
fi


fi

AC_LANG_RESTORE

])dnl
dnl
