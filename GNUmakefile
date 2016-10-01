#
# Makefile for building libExtAPI using libtool
# 
LIB=	ExtAPI
DBG=	-g
CPPFLAGS=-I. -DNON_MATLAB_PARSING -DMAX_EXT_API_CONNECTIONS=255
HDRS=	extApi.h extApiPlatform.h
SRCS=	extApi.c extApiPlatform.c
OBJS=	${SRCS:.c=.lo}
PREFIX?=/usr/local
GCC?=	gcc
GXX?=	g++
LLIB=	lib${LIB}.la

LIBTOOL?=libtool		# Use glibtool on macOS
INSTALL?=install
INSTALL_DIR?=${INSTALL} -d
INSTALL_HDR?=${INSTALL} -m 0644
INSTALL_LIB?=${LIBTOOL} --mode=install ${INSTALL} -m 0755
RM?=rm -f
E?=@

.SUFFIXES: .lo .c

.c.lo:
	$E${LIBTOOL} --mode=compile --tag=CC				\
		${GCC} ${CPPFLAGS} ${CFLAGS} ${DBG}			\
		-c -o $*.lo $*.c

.SUFFIXES: .lo .cc

.cc.lo:
	$E${LIBTOOL} --mode=compile --tag=CXX				\
		${GXX} ${CPPFLAGS} ${CFLAGS} ${DBG}			\
		-c -o $*.lo $*.cc

${LLIB}: ${OBJS} GNUmakefile
	$E${LIBTOOL} --mode=link --tag=CC				\
		${GCC} -o ${LLIB} -rpath ${PREFIX}/lib			\
		-version-number 1:0:0 ${LDFLAGS} ${OBJS} ${LIBS}

all: ${LLIB}

clean:
	${RM} ${OBJS}
	${RM} ${LLIB}
	${RM} -r .libs
	${RM} -r *.so
	${RM} -r *.la
	${RM} -r *.lo
	${RM} -r *.o

install: ${LLIB}
	${INSTALL_DIR} ${DESTDIR}${PREFIX}/lib
	${INSTALL_DIR} ${DESTDIR}${PREFIX}/include/${LIB}
	${INSTALL_HDR} ${HDRS} ${DESTDIR}${PREFIX}/include/${LIB}
	${INSTALL_LIB} ${LLIB} ${DESTDIR}${PREFIX}/lib

uninstall:
	${RM} -r ${DESTDIR}${PREFIX}/include/${LIB}
	${RM}    ${DESTDIR}${PREFIX}/lib/lib${LIB}.*
