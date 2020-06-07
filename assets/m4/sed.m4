dnl vim: set ts=2 sw=2 sts=2:
dnl
dnl Determine whether we have a working sed
dnl
dnl SED_AC_WORKING(SED_PATH)
dnl
dnl Sets ac_cv_sed to yes on success.

AC_DEFUN([SED_AC_WORKING],
    [AC_CACHE_CHECK([for working sed],
      ac_cv_sed,
      [
      if test -x $1 -a -f $1; then
        ac_cv_sed=$((echo 1 > test.h && $1 -i '/^/a \b' test.h && echo "yes") || echo "no")
      else
        ac_cv_sed=no
      fi
      ])
    ])
