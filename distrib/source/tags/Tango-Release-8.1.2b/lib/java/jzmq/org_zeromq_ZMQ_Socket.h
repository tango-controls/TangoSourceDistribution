/* DO NOT EDIT THIS FILE - it is machine generated */
/*
    Copyright (c) 2007-2013 iMatix Corporation

    This file is part of 0MQ.

    0MQ is free software; you can redistribute it and/or modify it under
    the terms of the Lesser GNU General Public License as published by
    the Free Software Foundation; either version 3 of the License, or
    (at your option) any later version.

    0MQ is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    Lesser GNU General Public License for more details.

    You should have received a copy of the Lesser GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/
#include <jni.h>
/* Header for class org_zeromq_ZMQ_Socket */

#ifndef _Included_org_zeromq_ZMQ_Socket
#define _Included_org_zeromq_ZMQ_Socket
#ifdef __cplusplus
extern "C" {
#endif
#undef org_zeromq_ZMQ_Socket_HWM
#define org_zeromq_ZMQ_Socket_HWM 1L
#undef org_zeromq_ZMQ_Socket_SWAP
#define org_zeromq_ZMQ_Socket_SWAP 3L
#undef org_zeromq_ZMQ_Socket_AFFINITY
#define org_zeromq_ZMQ_Socket_AFFINITY 4L
#undef org_zeromq_ZMQ_Socket_IDENTITY
#define org_zeromq_ZMQ_Socket_IDENTITY 5L
#undef org_zeromq_ZMQ_Socket_SUBSCRIBE
#define org_zeromq_ZMQ_Socket_SUBSCRIBE 6L
#undef org_zeromq_ZMQ_Socket_UNSUBSCRIBE
#define org_zeromq_ZMQ_Socket_UNSUBSCRIBE 7L
#undef org_zeromq_ZMQ_Socket_RATE
#define org_zeromq_ZMQ_Socket_RATE 8L
#undef org_zeromq_ZMQ_Socket_RECOVERY_IVL
#define org_zeromq_ZMQ_Socket_RECOVERY_IVL 9L
#undef org_zeromq_ZMQ_Socket_MCAST_LOOP
#define org_zeromq_ZMQ_Socket_MCAST_LOOP 10L
#undef org_zeromq_ZMQ_Socket_SNDBUF
#define org_zeromq_ZMQ_Socket_SNDBUF 11L
#undef org_zeromq_ZMQ_Socket_RCVBUF
#define org_zeromq_ZMQ_Socket_RCVBUF 12L
#undef org_zeromq_ZMQ_Socket_RCVMORE
#define org_zeromq_ZMQ_Socket_RCVMORE 13L
#undef org_zeromq_ZMQ_Socket_FD
#define org_zeromq_ZMQ_Socket_FD 14L
#undef org_zeromq_ZMQ_Socket_EVENTS
#define org_zeromq_ZMQ_Socket_EVENTS 15L
#undef org_zeromq_ZMQ_Socket_TYPE
#define org_zeromq_ZMQ_Socket_TYPE 16L
#undef org_zeromq_ZMQ_Socket_LINGER
#define org_zeromq_ZMQ_Socket_LINGER 17L
#undef org_zeromq_ZMQ_Socket_RECONNECT_IVL
#define org_zeromq_ZMQ_Socket_RECONNECT_IVL 18L
#undef org_zeromq_ZMQ_Socket_BACKLOG
#define org_zeromq_ZMQ_Socket_BACKLOG 19L
#undef org_zeromq_ZMQ_Socket_RECONNECT_IVL_MAX
#define org_zeromq_ZMQ_Socket_RECONNECT_IVL_MAX 21L
#undef org_zeromq_ZMQ_Socket_MAXMSGSIZE
#define org_zeromq_ZMQ_Socket_MAXMSGSIZE 22L
#undef org_zeromq_ZMQ_Socket_SNDHWM
#define org_zeromq_ZMQ_Socket_SNDHWM 23L
#undef org_zeromq_ZMQ_Socket_RCVHWM
#define org_zeromq_ZMQ_Socket_RCVHWM 24L
#undef org_zeromq_ZMQ_Socket_MULTICAST_HOPS
#define org_zeromq_ZMQ_Socket_MULTICAST_HOPS 25L
#undef org_zeromq_ZMQ_Socket_RCVTIMEO
#define org_zeromq_ZMQ_Socket_RCVTIMEO 27L
#undef org_zeromq_ZMQ_Socket_SNDTIMEO
#define org_zeromq_ZMQ_Socket_SNDTIMEO 28L
#undef org_zeromq_ZMQ_Socket_IPV4ONLY
#define org_zeromq_ZMQ_Socket_IPV4ONLY 31L
#undef org_zeromq_ZMQ_Socket_ROUTER_MANDATORY
#define org_zeromq_ZMQ_Socket_ROUTER_MANDATORY 33L
#undef org_zeromq_ZMQ_Socket_KEEPALIVE
#define org_zeromq_ZMQ_Socket_KEEPALIVE 34L
#undef org_zeromq_ZMQ_Socket_KEEPALIVECNT
#define org_zeromq_ZMQ_Socket_KEEPALIVECNT 35L
#undef org_zeromq_ZMQ_Socket_KEEPALIVEIDLE
#define org_zeromq_ZMQ_Socket_KEEPALIVEIDLE 36L
#undef org_zeromq_ZMQ_Socket_KEEPALIVEINTVL
#define org_zeromq_ZMQ_Socket_KEEPALIVEINTVL 37L
/*
 * Class:     org_zeromq_ZMQ_Socket
 * Method:    bind
 * Signature: (Ljava/lang/String;)V
 */
JNIEXPORT void JNICALL Java_org_zeromq_ZMQ_00024Socket_bind
  (JNIEnv *, jobject, jstring);

/*
 * Class:     org_zeromq_ZMQ_Socket
 * Method:    unbind
 * Signature: (Ljava/lang/String;)V
 */
JNIEXPORT void JNICALL Java_org_zeromq_ZMQ_00024Socket_unbind
  (JNIEnv *, jobject, jstring);

/*
 * Class:     org_zeromq_ZMQ_Socket
 * Method:    connect
 * Signature: (Ljava/lang/String;)V
 */
JNIEXPORT void JNICALL Java_org_zeromq_ZMQ_00024Socket_connect
  (JNIEnv *, jobject, jstring);

/*
 * Class:     org_zeromq_ZMQ_Socket
 * Method:    disconnect
 * Signature: (Ljava/lang/String;)V
 */
JNIEXPORT void JNICALL Java_org_zeromq_ZMQ_00024Socket_disconnect
  (JNIEnv *, jobject, jstring);

/*
 * Class:     org_zeromq_ZMQ_Socket
 * Method:    send
 * Signature: ([BIII)Z
 */
JNIEXPORT jboolean JNICALL Java_org_zeromq_ZMQ_00024Socket_send
  (JNIEnv *, jobject, jbyteArray, jint, jint, jint);

/*
 * Class:     org_zeromq_ZMQ_Socket
 * Method:    sendZeroCopy
 * Signature: (Ljava/nio/ByteBuffer;II)Z
 */
JNIEXPORT jboolean JNICALL Java_org_zeromq_ZMQ_00024Socket_sendZeroCopy
  (JNIEnv *, jobject, jobject, jint, jint);

/*
 * Class:     org_zeromq_ZMQ_Socket
 * Method:    recv
 * Signature: (I)[B
 */
JNIEXPORT jbyteArray JNICALL Java_org_zeromq_ZMQ_00024Socket_recv__I
  (JNIEnv *, jobject, jint);

/*
 * Class:     org_zeromq_ZMQ_Socket
 * Method:    recv
 * Signature: ([BIII)I
 */
JNIEXPORT jint JNICALL Java_org_zeromq_ZMQ_00024Socket_recv___3BIII
  (JNIEnv *, jobject, jbyteArray, jint, jint, jint);

/*
 * Class:     org_zeromq_ZMQ_Socket
 * Method:    recvZeroCopy
 * Signature: (Ljava/nio/ByteBuffer;II)I
 */
JNIEXPORT jint JNICALL Java_org_zeromq_ZMQ_00024Socket_recvZeroCopy
  (JNIEnv *, jobject, jobject, jint, jint);

/*
 * Class:     org_zeromq_ZMQ_Socket
 * Method:    construct
 * Signature: (Lorg/zeromq/ZMQ/Context;I)V
 */
JNIEXPORT void JNICALL Java_org_zeromq_ZMQ_00024Socket_construct
  (JNIEnv *, jobject, jobject, jint);

/*
 * Class:     org_zeromq_ZMQ_Socket
 * Method:    finalize
 * Signature: ()V
 */
JNIEXPORT void JNICALL Java_org_zeromq_ZMQ_00024Socket_finalize
  (JNIEnv *, jobject);

/*
 * Class:     org_zeromq_ZMQ_Socket
 * Method:    getLongSockopt
 * Signature: (I)J
 */
JNIEXPORT jlong JNICALL Java_org_zeromq_ZMQ_00024Socket_getLongSockopt
  (JNIEnv *, jobject, jint);

/*
 * Class:     org_zeromq_ZMQ_Socket
 * Method:    getBytesSockopt
 * Signature: (I)[B
 */
JNIEXPORT jbyteArray JNICALL Java_org_zeromq_ZMQ_00024Socket_getBytesSockopt
  (JNIEnv *, jobject, jint);

/*
 * Class:     org_zeromq_ZMQ_Socket
 * Method:    setLongSockopt
 * Signature: (IJ)V
 */
JNIEXPORT void JNICALL Java_org_zeromq_ZMQ_00024Socket_setLongSockopt
  (JNIEnv *, jobject, jint, jlong);

/*
 * Class:     org_zeromq_ZMQ_Socket
 * Method:    setBytesSockopt
 * Signature: (I[B)V
 */
JNIEXPORT void JNICALL Java_org_zeromq_ZMQ_00024Socket_setBytesSockopt
  (JNIEnv *, jobject, jint, jbyteArray);

#ifdef __cplusplus
}
#endif
#endif
