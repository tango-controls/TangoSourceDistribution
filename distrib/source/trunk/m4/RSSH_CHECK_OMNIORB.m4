dnl@synposis RSSH_CHECK_CORBA_ORB 
dnl
dnl set CORBA support for omniORB v3-pr2 or highter
dnl    ( http://www.uk.research.att.com/omniORB/omniORB.html)
dnl
dnl@author (C) Ruslan Shevchenko <Ruslan@Shevchenko.Kiev.UA>, 1999, 2000
dnl@id $Id: RSSH_CHECK_OMNIORB.m4,v 1.20 2002/01/16 16:33:28 yad Exp $
dnl
AC_DEFUN([RSSH_CHECK_OMNIORB],[
AC_REQUIRE([AC_PROG_CC])
AC_REQUIRE([AC_PROG_CXX])
AC_REQUIRE([AC_PROG_CPP])
AC_REQUIRE([AC_PROG_CXXCPP])


AC_ARG_WITH(omni, AC_HELP_STRING([--with-omni],[prefix to omniORB installation (default: $OMNI_ROOT)]) ,\
            OMNI_PREFIX=${with_omni} , OMNI_PREFIX=/usr/local )

if test "x$OMNI_ROOT" = "x"
then
 if test "x$OMNI_PREFIX" = "x"
 then
   OMNI_ROOT="/usr/local"
 else
   OMNI_ROOT="$OMNI_PREFIX"
 fi
fi

if  test "x$OMNI_PREFIX" = "xno"
then
dnl OMNI NOT SET 
  AC_MSG_RESULT(omniORB is disabled)
  omni=no
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
SL_SUFFIX=so
case $build_os in
 darwin*)
    AC_DEFINE(__darwin__,1,If we're running on darwin/MacOsX)
    IDLCXXFLAGS="$IDLCXXFLAGS -D__darwin__"
	 SL_SUFFIX=dylib
	 ;;	 
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
 hpux*)
     AC_DEFINE(__hpux__,1,If we're running on hpux)
    IDLCXXFLAGS="$IDLCXXFLAGS -AA -mt -D__hpux__ -D__hppa__ -D__OMNIORB4__"
    __OSVERSION__=11
    AC_DEFINE_UNQUOTED(__OSVERSION__, $__OSVERSION__,Needed by omniorb)
    IDLCXXFLAGS="$IDLCXXFLAGS -D__OSVERSION__=11"
    SL_SUFFIX=sl
    ;;
esac

AC_SUBST(IDLCXXFLAGS)

CXXCPPFLAGS="$CXXCPPFLAGS $IDLCXXFLAGS"

AC_CHECK_HEADER( omniORB4/CORBA.h, omni=yes , omni=no, )

if test "x$omni" = "xyes" 
then
  ORB_LIBDIR="$OMNI_ROOT/lib"
  if test ! -r "$ORB_LIBDIR/libomniORB4.$SL_SUFFIX"
  then
    for i in $OMNI_ROOT/lib/*/lib*.$SL_SUFFIX
    do
      ORB_LIBDIR=`dirname $i` 
      break;
    done
  fi

  LIBS="$LIBS -lomnithread"
  svLIBS=$LIBS
  LIBS="-L$ORB_LIBDIR $LIBS"

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
    omni_lib=no
  fi
  AC_CHECK_LIB(socket,socket, LIBS="-lsocket $LIBS",,)
  AC_CHECK_LIB(nsl,gethostbyname, LIBS="-lnsl $LIBS",,)

  ORB_LDFLAGS="-L$ORB_LIBDIR"
  LIBS="$ORB_LDFLAGS -lomniORB4 -lomniDynamic4 -lCOS4 $svLIBS $LIBS"
  AC_CACHE_CHECK([whether we can link with omniORB4],
    rssh_cv_check_omniORBlib,
    AC_TRY_LINK(
#include <omniORB4/CORBA.h>
,CORBA::ORB_var orb,
    rssh_cv_check_omniORBlib=yes,rssh_cv_check_omniORBlib=no
    )
  )

  if  test ! $rssh_cv_check_omniORBlib = yes
  then
    AC_MSG_RESULT("omniORB libs not found")
    omni_lib=no
  fi


  ORB_LIBS="$ORB_LDFLAGS -lomniORB4 -lomnithread"
fi

if test "x$omni_lib" = "xno"
then
 AC_MSG_RESULT(omniORB library linking failed)
 omni="no"
fi

fi

dnl omniorb_AC_HAVE_OMNIORB_VERSION($OMNI_ROOT/include/omniORB4,4,1,0)
dnl if test "x$ac_cv_omniorb_version_4_1_0" = "xno"; then
dnl 	AC_MSG_ERROR([Not supported omniORB release. Should be 4.1.0 or above. Please update !],-1)
dnl fi

dnl
dnl The following tests are only to reject omniORB release 4.1.1
dnl which has some annoying bugs fixed in omniORB 4.1.2
dnl

export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$OMNI_ROOT/lib/pkgconfig
PKG_CHECK_MODULES([omniORB4], [omniORB4 >= 4.1.2])
PKG_CHECK_MODULES([omniCOS4], [omniCOS4 >= 4.1.2])

dnl omniorb_AC_HAVE_OMNIORB_VERSION($OMNI_ROOT/include/omniORB4,4,1,1)
dnl omniorb_AC_HAVE_OMNIORB_VERSION($OMNI_ROOT/include/omniORB4,4,1,2)
dnl if test "x$ac_cv_omniorb_version_4_1_1" = "xyes"; then
dnl	if test "x$ac_cv_omniorb_version_4_1_2" = "xno"; then
dnl		AC_MSG_ERROR([omniORB release 4.1.1 is not supported. Should be 4.1.0 or 4.1.2 and above. Please update !],-1)
dnl	fi
dnl fi

if test -x $OMNI_ROOT/include/omniORB4
then
   VERS=`grep VERSION $OMNI_ROOT/include/omniORB4/acconfig.h 2>&1 | cut -d ' ' -f 3`
   OMNI_VERSION=$VERS
fi


if test "x$omni" = "x" -o "x$omni" = "xno"
then
  CXXCPPFLAGS=$svCXXCPPFLAGS
  CPPFLAGS=$svCPPFLAGS
  LIBS=$svLIBS
  LDFLAGS=$svLDFLAGS
  ORB=unknown
  omni=no
  eval "$rssh_rollback"
  rssh_rollback=$svRSSH_ROLLBACK 
else
  AC_SUBST(CORBA_INCLUDES)

  ORB_PREFIX=$OMNI_ROOT
  AC_SUBST(ORB_PREFIX)

  ORB=omniORB
  AC_SUBST(ORB)

  IDL=omniidl
  if test -x $OMNI_ROOT/bin/omniidl
  then
    IDL=$OMNI_ROOT/bin/omniidl
  else
    for i in $OMNI_ROOT/bin/*/omniidl
    do
      if test "$i" != $OMNI_ROOT'/bin/*/omniidl'
      then
        IDL=$i
        break
      fi
    done 
  fi
  AC_SUBST(IDL)
  IDLCXX=$IDL
  AC_SUBST(IDLCXX)

  IDLFLAGS="$IDLFLAGS -bcxx -I$OMNI_ROOT/idl"
  AC_SUBST(IDLFLAGS)

  ORB_INCLUDE_PREFIX=$ORB_INCLUDES
  AC_SUBST(ORB_INCLUDE_PREFIX)

  IDL_H_SUFFIX=.hh
  AC_SUBST(IDL_H_SUFFIX)
  IDL_H1_SUFFIX=no
  AC_SUBST(IDL_H1_SUFFIX)

  IDL_CLN_H=.hh
  IDL_CLN_H_SUFFIX=.hh
  IDL_CLN_H1_SUFFIX=no

  AC_SUBST(IDL_CLN_H,$IDL_CLN_H)
  AC_SUBST(IDL_CLN_H_SUFFIX,$IDL_CLN_H_SUFFIX)
  AC_SUBST(IDL_CLN_H1_SUFFIX,$IDL_CLN_H1_SUFFIX)
  AC_DEFINE_UNQUOTED(IDL_CLN_H_SUFFIX,$IDL_CLN_H_SUFFIX,1,"")

  IDL_CLN_CPP=SK.cc
  IDL_CLN_CPP_SUFFIX=SK.cc
  AC_SUBST(IDL_CLN_CPP,$IDL_CLN_CPP)
  AC_SUBST(IDL_CLN_CPP_SUFFIX,$IDL_CLN_CPP_SUFFIX)
  AC_DEFINE_UNQUOTED(IDL_CLN_CPP_SUFFIX,$IDL_CLN_CPP,1,"")

  IDL_CLN_O=SK.o 
  IDL_CLN_OBJ_SUFFIX=SK.o 
  AC_SUBST(IDL_CLN_O,$IDL_CLN_O)
  AC_SUBST(IDL_CLN_OBJ_SUFFIX,$IDL_CLN_OBJ_SUFFIX)

  IDL_SRV_H=.hh
  IDL_SRV_H_SUFFIX=.hh
  IDL_SRV_H1_SUFFIX=no
  AC_SUBST(IDL_SRV_H,$IDL_SRV_H)
  AC_SUBST(IDL_SRV_H_SUFFIX,$IDL_SRV_H_SUFFIX)
  AC_SUBST(IDL_SRV_H1_SUFFIX,$IDL_SRV_H1_SUFFIX)
  AC_DEFINE_UNQUOTED(IDL_SRV_H_SUFFIX,$IDL_SRV_H_SUFFIX,1,"")

  IDL_SRV_CPP=SK.cc
  IDL_SRV_CPP_SUFFIX=SK.cc
  AC_SUBST(IDL_SRV_CPP,$IDL_SRV_CPP)
  AC_SUBST(IDL_SRV_CPP_SUFFIX,$IDL_SRV_CPP_SUFFIX)
  AC_DEFINE_UNQUOTED(IDL_SRV_H_SUFFIX,$IDL_SRV_H_SUFFIX,1,"")

  IDL_SRV_O=SK.o
  IDL_SRV_OBJ_SUFFIX=SK.o
  AC_SUBST(IDL_SRV_O,$IDL_SRV_O)
  AC_SUBST(IDL_SRV_OBJ_SUFFIX,$IDL_SRV_OBJ_SUFFIX)

  IDL_TIE_H_SUFFIX=no
  IDL_TIE_H1_SUFFIX=no
  IDL_TIE_CPP_SUFFIX=no
  AC_SUBST(IDL_TIE_H_SUFFIX,$IDL_TIE_H_SUFFIX)
  AC_SUBST(IDL_TIE_H1_SUFFIX,$IDL_TIE_H1_SUFFIX)
  AC_SUBST(IDL_TIE_CPP_SUFFIX,$IDL_TIE_CPP_SUFFIX)

  CORBA_H='omniORB4/CORBA.h'
  AC_DEFINE_UNQUOTED(CORBA_H,<$CORBA_H>, "")

  COSNAMING_H='omniORB4/Naming.hh'
  AC_DEFINE_UNQUOTED(COSNAMING_H,<$COSNAMING_H>, "")

  ORB_COSNAMING_LIB= 
  AC_SUBST(ORB_COSNAMING_LIB)

dnl i. e. it's build into ORB lib

  HAVE_ORB_IDL=1
  AC_SUBST(HAVE_ORB_IDL)

  AC_CACHE_CHECK([whether CORBA modules mapped to namespaces],
    rssh_cv_corba_namespaces,
  AC_TRY_COMPILE(#include <$CORBA_H>
,
[
#ifndef HAS_Cplusplus_Namespace
#error "we have no namespaces"
we have no namespaces -- $$$$
#else
return 0;
#endif
], rssh_cv_corba_namespaces=yes, rssh_cv_corba_namespaces=no)
  )

  if test "$rssh_cv_corba_namespaces" = "yes" 
  then
    AC_DEFINE(CORBA_MODULE_NAMESPACE_MAPPING,1, "")
  else
    AC_DEFINE(CORBA_MODULE_CLASS_MAPPING,1,"")
  fi
  
  AC_DEFINE(OMNIORB,1,"if we're working with omniorb")

  CORBA_HAVE_POA=1
  AC_DEFINE(CORBA_HAVE_POA,1, "if our orb has a poa")

  CORBA_ORB_INIT_HAVE_3_ARGS=1
  AC_DEFINE(CORBA_ORB_INIT_HAVE_3_ARGS,1,"if our orb-init has 3 args")
  CORBA_ORB_INIT_THIRD_ARG='"omniORB4"'
  AC_DEFINE(CORBA_ORB_INIT_THIRD_ARG, "omniORB4", "what the third argument is")
  AC_DEFINE(CORBA_ORB_HAVE_DESTROY,1,"")


fi

AC_LANG_RESTORE

])dnl
dnl
