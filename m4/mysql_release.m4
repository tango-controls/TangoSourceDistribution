dnl Determine whether we have mysql of a particular version or later,
dnl based on major, minor, patchlevel versions and date.
dnl
dnl mysql_AC_HAVE_MYSQL_VERSION(MYSQL_PATH,
dnl                           MAJOR_VERSION,
dnl                           MINOR_VERSION)
dnl   

AC_DEFUN([mysql_AC_HAVE_MYSQL_VERSION],
	 [AC_CACHE_CHECK([for mysql release (at least version $2.$3)],
	                 ac_cv_mysql_version_$2_$3,
           [            
			  if test -x $1; then
			 		VERS=`$1 --version 2>&1 | cut -d ' ' -f 6 | cut -d ',' -f 1`
					MYSQL_VERSION=$VERS
					
	         		MYSQL_MAJOR=`echo $VERS | cut -d '.' -f 1`
			 		MYSQL_MINOR=`echo $VERS | cut -d '.' -f 2`
			 		MYSQL_MICRO=`echo $VERS | cut -d '.' -f 3`
					MARIA=`echo $MYSQL_MICRO | cut -d '-' -f 2`

					if test -z $MARIA; then
				 		if test $MYSQL_MAJOR -lt $2; then
							ac_cv_mysql_version_$2_$3=no
				 		else
							if test $MYSQL_MINOR -lt $3; then
					    		ac_cv_mysql_version_$2_$3=no
				    	 	else
					    		ac_cv_mysql_version_$2_$3=yes
							fi			        
						fi
					else
						MYSQL_VERSION=not_found
						ac_cv_mysql_version_$2_$3=no
					fi
				else
					ac_cv_mysql_version_$2_$3=no	
				fi
			])     
     ])
