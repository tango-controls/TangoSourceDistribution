# Markus Fischer <<EMAIL: PROTECTED>>,  23.9.1999
# URL : http://josefine.ben.tuwien.ac.at/~mfischer/m4/mariadb-client.m4
# Last Modified : Thu Sep 23 14:24:15 CEST 1999
#
# written from scratch

dnl Test for libmariadbclient and
dnl define MARIADBCLIENT_CFLAGS, MARIADBCLIENT_LDFLAGS and MARIADBCLIENT_LIBS
dnl usage:
dnl AM_PATH_MARIADBCLIENT(
dnl 	[MINIMUM-VERSION,
dnl 	[ACTION-IF-FOUND [,
dnl 	ACTION-IF-NOT-FOUND ]]])
dnl

AC_DEFUN([AM_PATH_MARIADBCLIENT],
[
AC_ARG_WITH(mariadbclient-prefix,
		AC_HELP_STRING([--with-mariadbclient-prefix=PFX],[Prefix where mariadbclient is installed]),
            mariadbclient_prefix="$withval",
            mariadbclient_prefix="")

AC_ARG_WITH(mariadbclient-include, AC_HELP_STRING([--with-mariadbclient-include=DIR],[Directory pointing to mariadbclient include files]),
            mariadbclient_include="$withval",
            mariadbclient_include="")

AC_ARG_WITH(mariadbclient-lib,AC_HELP_STRING([--with-mariadbclient-lib=LIB],[Directory pointing to mariadbclient library (Note: -include and -lib do override paths found with -prefix)]),
            mariadbclient_lib="$withval",
            mariadbclient_lib="")

    AC_MSG_CHECKING([for mariadbclient ifelse([$1], , ,[>= v$1])])
    MARIADBCLIENT_LDFLAGS=""
    MARIADBCLIENT_CFLAGS=""
    MARIADBCLIENT_LIBS="-lmariadb"
    mariadbclient_fail=""

    dnl test --with-mariadbclient-prefix
    for tryprefix in /usr /usr/local /usr/mysql /usr/local/mysql /usr/pkg $mariadbclient_prefix ; do
		for hloc in lib/mariadb lib ; do
			if test -f "$tryprefix/$hloc/libmariadb.so"; then
                MARIADBCLIENT_LDFLAGS="-L$tryprefix/$hloc"
			elif test -f "$tryprefix/$hloc/libmariadb.a"; then
                MARIADBCLIENT_LDFLAGS="-L$tryprefix/$hloc"
			fi
		done

		for iloc in include/mariadb include include/mysql; do
			if test -f "$tryprefix/$iloc/mysql.h"; then
                MARIADBCLIENT_CFLAGS="-I$tryprefix/$iloc"
            fi
        done
		# testloop
	done

    dnl test --with-mariadbclient-include
    if test "x$mariadbclient_include" != "x" ; then
		echo "checking for mariadb includes... "
        if test -d "$mariadbclient_include/mariadb" ; then
            MARIADBCLIENT_CFLAGS="-I$mariadbclient_include"
			echo " found $MARIADBCLIENT_CFLAGS"
        elif test -d "$mariadbclient_include/include/mariadb" ; then
            MARIADBCLIENT_CFLAGS="-I$mariadbclient_include/include"
			echo " found $MARIADBCLIENT_CFLAGS"
        elif test -d "$mariadbclient_include" ; then
            MARIADBCLIENT_CFLAGS="-I$mariadbclient_include"
			echo "found $MARIADBCLIENT_CFLAGS"
		else
			echo "not found!  no include dir found in $mariadbclient_include"
        fi
    fi

    dnl test --with-mariadbclient-lib
    if test "x$mariadbclient_lib" != "x" ; then
		echo "checking for mariadb libx... "
        if test -d "$mariadbclient_lib/lib/mariadb" ; then
            MARIADBCLIENT_LDFLAGS="-L$mariadbclient_lib/lib/mariadb"
			echo "found $MARIADBCLIENT_LDFLAGS"
        elif test -d "$mariadbclient_lib/lin" ; then
            MARIADBCLIENT_LDFLAGS="-L$mariadbclient_lib/lib"
			echo "found $MARIADBCLIENT_LDFLAGS"
        else
            MARIADBCLIENT_LDFLAGS="-L$mariadbclient_lib"
			echo "defaultd to $MARIADBCLIENT_LDFLAGS"
        fi
    fi

    ac_save_CFLAGS="$CFLAGS"
    ac_save_LDFLAGS="$LDFLAGS"
    ac_save_LIBS="$LIBS"
    CFLAGS="-v $CFLAGS $MARIADBCLIENT_CFLAGS"
    LDFLAGS="$LDFLAGS $MARIADBCLIENT_LDFLAGS"
    LIBS="$LIBS $MARIADBCLIENT_LIBS"
    dnl if no minimum version is given, just try to compile
    dnl else try to compile AND run
        AC_TRY_LINK([
            #include <mysql.h>
            #include <mysql_version.h>
        ],[
            mysql_init( 0 );
        ], [AC_MSG_RESULT(yes $MARIADBCLIENT_CFLAGS $MARIADBCLIENT_LDFLAGS)
           CFLAGS="$ac_save_CFLAGS"
           LDFLAGS="$ac_save_LDFLAGS"
           LIBS="$ac_save_LIBS"
           ifelse([$2], ,:,[$2])
        ],[
            echo "no"
            echo "can't compile a simple app with mysql_connnect in it. bad."
            mariadbclient_fail="yes"
        ])

    if test "x$mariadbclient_fail" != "x" ; then
            dnl AC_MSG_RESULT(no)
            echo
            echo "***"
            echo "*** mariadbclient test source had problems, check your config.log ."
            echo "*** Also try one of the following switches :"
            echo "***   --with-mariadbclient-prefix=PFX"
            echo "***   --with-mariadbclient-include=DIR"
            echo "***   --with-mariadbclient-lib=DIR"
            echo "***"
            CFLAGS="$ac_save_CFLAGS"
            LDFLAGS="$ac_save_LDFLAGS"
            LIBS="$ac_save_LIBS"
            MARIADBCLIENT_LIBS=""
            MARIADBCLIENT_CFLAGS=""
            ifelse([$3], ,:,[$3])
    fi

    CFLAGS="$ac_save_CFLAGS"
    LDFLAGS="$ac_save_LDFLAGS"
    LIBS="$ac_save_LIBS"
    AC_SUBST(MARIADBCLIENT_LDFLAGS)
    AC_SUBST(MARIADBCLIENT_CFLAGS)
    AC_SUBST(MARIADBCLIENT_LIBS)
])
