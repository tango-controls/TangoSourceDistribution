dnl Determine whether we have mariadb of a particular version or later,
dnl based on major, minor, patchlevel versions and date.
dnl
dnl mariadb_AC_HAVE_MARIADB_VERSION(MARIADB_PATH,
dnl                           MAJOR_VERSION,
dnl                           MINOR_VERSION)
dnl   

AC_DEFUN([mariadb_AC_HAVE_MARIADB_VERSION],
	 [AC_CACHE_CHECK([for mariadb release (at least version $2.$3)],
	                 ac_cv_mariadb_version_$2_$3,
           [            
			  if test -x $1; then
			 		VERS=`$1 --version 2>&1 | cut -d ' ' -f 6 | cut -d ',' -f 1`
					MARIADB_VERSION=$VERS
					
	         		MARIADB_MAJOR=`echo $VERS | cut -d '.' -f 1`
			 		MARIADB_MINOR=`echo $VERS | cut -d '.' -f 2`
			 		MARIADB_MICRO=`echo $VERS | cut -d '.' -f 3`

			 		if test $MARIADB_MAJOR -lt $2; then
			    		ac_cv_mariadb_version_$2_$3=no
			 		else
			    		if test $MARIADB_MINOR -lt $3; then
			        		ac_cv_mariadb_version_$2_$3=no
		        	 	else
			        		ac_cv_mariadb_version_$2_$3=yes
		    			fi			        
					fi
				else
					ac_cv_mariadb_version_$2_$3=no	
				fi
			])     
     ])
