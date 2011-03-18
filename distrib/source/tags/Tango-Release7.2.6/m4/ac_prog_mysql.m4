dnl @synopsis AC_PROG_MYSQL
dnl
dnl Check for the program 'mysql'
dnl let script continue if exists & works
dnl pops up error message if not.
dnl
dnl Testing of functionality is by invoking it with root password ''
dnl and a 'SELECT * FROM user' SQL statement.
dnl The user and passwd can be controlled with the --with-mysql-admin and
dnl the --with-mysql-admin-passwd
dnl We can also control the host with the --with-mysql-host switch.
dnl That SQL statement will select all user information from the 'user'
dnl privileges table, dnl and should work on every proper MySQL server.
dnl
dnl Besides checking mysql, this macro also set these environmentb
dnl variables upon completion:
dnl
dnl     MYSQL = which mysql
dnl
dnl @version $Id: ac_prog_mysql.m4,v 1.2 2002/04/11 14:20:17 simons Exp $
dnl @author Gleen Salmon <gleensalmon@yahoo.com>
dnl 
AC_DEFUN([AC_PROG_MYSQL],[

AC_REQUIRE([AC_EXEEXT])dnl

AC_PATH_PROG(MYSQL, mysql$EXEEXT, nocommand)
if test "$MYSQL" = nocommand; then
        AC_MSG_WARN([mysql not found in $PATH])
		  enable_db_schema_create=no
else

	AC_ARG_WITH(mysql-ho, AC_HELP_STRING([--with-mysql-ho],[the host of the mysql database (default: <blank>)]), MYSQL_HOST=${with_mysql_ho}, MYSQL_HOST="")

	AC_ARG_WITH(mysql-admin,AC_HELP_STRING([--with-mysql-admin],[super user of your mysql database (default: <blank>)]), MYSQL_ADMIN=${with_mysql_admin}, MYSQL_ADMIN="")

	AC_ARG_WITH(mysql-admin-passwd, AC_HELP_STRING([--with-mysql-admin-passwd],[super user password of your mysql database (default: <blank>)]), MYSQL_ADMIN_PASSWD=${with_mysql_admin_passwd}, MYSQL_ADMIN_PASSWD="")

	if test "x$MYSQL_ADMIN" = "x"; then
		user_switch="";
	else
		user_switch="-u$MYSQL_ADMIN";
	fi

	if test "x$MYSQL_ADMIN_PASSWD" = "x"; then
  		passwd_switch="";
	else
  		passwd_switch="-p$MYSQL_ADMIN_PASSWD";
	fi

	if test "x$MYSQL_HOST" = "x"; then
  		host_switch="";
	else
  		host_switch="-h$MYSQL_HOST";
	fi

	AC_MSG_CHECKING([if mysql works])

	if echo 'SELECT * FROM user' | $MYSQL $user_switch $passwd_switch $host_switch mysql> /dev/null; then
            AC_MSG_RESULT([yes])
 		AC_SUBST(MYSQL_ADMIN)
 		AC_SUBST(MYSQL_ADMIN_PASSWD)
 		AC_SUBST(MYSQL)
 		AC_SUBST(MYSQL_HOST)
		
		MYSQL_CONNECTION=OK

 	else
 
			AC_MSG_WARN([mysql cannot execute SELECT with user=$MYSQL_ADMIN, passwd=$MYSQL_ADMIN_PASSWD, and  host=$MYSQL_HOST. Please check your my.cnf file or configure options!])
			MYSQL_CONNECTION=failed
			enable_db_schema_create=no
	fi;dnl
	AC_DEFINE_UNQUOTED(MYSQL_HOST,"$MYSQL_HOST", "the host running mysql")
fi
])
