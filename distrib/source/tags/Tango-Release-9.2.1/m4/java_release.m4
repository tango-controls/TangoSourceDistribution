dnl Determine whether we have java of a particular version or later,
dnl based on major, minor, patchlevel versions and date.
dnl
dnl java_AC_HAVE_JAVA_VERSION(JAVA_PATH,
dnl                           MAJOR_VERSION,
dnl                           MINOR_VERSION)
dnl   

AC_DEFUN([java_AC_HAVE_JAVA_VERSION],
	 [AC_CACHE_CHECK([for java release (at least version $2.$3)],
	                 ac_cv_java_version_$2_$3,
          [            
			 if test -x $1 -a -f $1; then
			 	VERS=`$1 -version 2>&1 | grep version | cut -d '"' -f 2`
				JAVA_VERSION=$VERS
				
	         JAVA_MAJOR=`echo $VERS | cut -d '.' -f 1`
			 	JAVA_MINOR=`echo $VERS | cut -d '.' -f 2`
			 	JAVA_MICRO=`echo $VERS | cut -d '.' -f 3`
			 
dnl			 echo "JAVA MAJOR = $JAVA_MAJOR"
dnl			 echo "JAVA MINOR = $JAVA_MINOR"
dnl			 echo "JAVA MICRO = $JAVA_MICRO"

			 	if test $JAVA_MAJOR -lt $2; then
			    	ac_cv_java_version_$2_$3=no
			 	else
			    		if test $JAVA_MINOR -lt $3; then
			        	ac_cv_java_version_$2_$3=no
		        	 	else
			        	ac_cv_java_version_$2_$3=yes
						fi
		    	fi
			else
			ac_cv_java_version_$2_$3=no	
			fi
		])     
     ])
