dnl Determine whether we have omniORB of a particular version or later,
dnl based on major, minor, patchlevel versions and date.
dnl
dnl omniorb_AC_HAVE_OMNIORB_VERSION(OMNI_INCL_PATH,
dnl                           MAJOR_VERSION,
dnl                           MINOR_VERSION,
dnl							  MICRO_VERSION)
dnl   

AC_DEFUN([omniorb_AC_HAVE_OMNIORB_VERSION],
	 [AC_CACHE_CHECK([for omniORB release (at least version $2.$3.$4)],
	                 ac_cv_omniorb_version_$2_$3_$4,
           	[            
			 	if test -x $1; then
			 		VERS=`grep VERSION $1/acconfig.h 2>&1 | cut -d ' ' -f 3`
					OMNI_VERSION=$VERS
				
	         	OMNIORB_MAJOR=`echo $VERS | cut -b 2`
			 		OMNIORB_MINOR=`echo $VERS | cut -b 4`
			 		OMNIORB_MICRO=`echo $VERS | cut -b 6`
			 
dnl			 	echo "OMNIORB MAJOR = $OMNIORB_MAJOR"
dnl			 	echo "OMNIORB MINOR = $OMNIORB_MINOR"
dnl			 	echo "OMNIORB MICRO = $OMNIORB_MICRO"

			 		if test $OMNIORB_MAJOR -lt $2; then
			    		ac_cv_omniorb_version_$2_$3_$4=no
			 		else
			    		if test $OMNIORB_MINOR -lt $3; then
			        		ac_cv_omniorb_version_$2_$3_$4=no
						else
							if test $OMNIORB_MICRO -lt $4; then
								ac_cv_omniorb_version_$2_$3_$4=no
							else
			        			ac_cv_omniorb_version_$2_$3_$4=yes
							fi
						fi					
		    		fi
				else
					ac_cv_omniorb_version_$2_$3_$4=no	
				fi
			])     
     ])
