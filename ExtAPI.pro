# Copyright 2016 Rene Hexel.  All rights reserved.
# r.hexel@griffith.edu.au
# www.ict.griffith.edu.au/~rhexel
# 
# -------------------------------------------------------------------
# THIS FILE IS DISTRIBUTED "AS IS", WITHOUT ANY EXPRESS OR IMPLIED
# WARRANTY. THE USER WILL USE IT AT HIS/HER OWN RISK. THE ORIGINAL
# AUTHORS AND COPPELIA ROBOTICS GMBH WILL NOT BE LIABLE FOR DATA LOSS,
# DAMAGES, LOSS OF PROFITS OR ANY OTHER KIND OF LOSS WHILE USING OR
# MISUSING THIS SOFTWARE.
# 
# You are free to use/modify/distribute this file for whatever purpose!
# -------------------------------------------------------------------
#

QT -= core
QT -= gui

NAME = ExtAPI
TARGET = $$NAME
TEMPLATE = lib

DEFINES -= UNICODE
CONFIG  += console
CONFIG  -= app_bundle

DEFINES += NON_MATLAB_PARSING
DEFINES += MAX_EXT_API_CONNECTIONS=255

*-g++* {
    QMAKE_CXXFLAGS += -O3
    QMAKE_CXXFLAGS += -Wall
    QMAKE_CXXFLAGS += -Wno-unused-parameter
    QMAKE_CXXFLAGS += -Wno-strict-aliasing
    QMAKE_CXXFLAGS += -Wno-empty-body
    QMAKE_CXXFLAGS += -Wno-write-strings

    QMAKE_CXXFLAGS += -Wno-unused-but-set-variable
    QMAKE_CXXFLAGS += -Wno-unused-local-typedefs
    QMAKE_CXXFLAGS += -Wno-narrowing

    QMAKE_CFLAGS += -O3
    QMAKE_CFLAGS += -Wall
    QMAKE_CFLAGS += -Wno-strict-aliasing
    QMAKE_CFLAGS += -Wno-unused-parameter
    QMAKE_CFLAGS += -Wno-unused-but-set-variable
    QMAKE_CFLAGS += -Wno-unused-local-typedefs
}

macx {
    QMAKE_CC   = xcrun clang
    QMAKE_CXX  = xcrun clang++
    QMAKE_LINK = xcrun clang++
}

unix:!macx {
}


INCLUDEPATH += "."

SOURCES += \
    extApi.c \
    extApiPlatform.c

HEADERS +=\
    extApi.h \
    extApiPlatform.h

unix:!symbian {
    maemo5 {
    	PREFIX = /opt/usr
        target.path = $$INSTALLBASE$$PREFIX/lib
    } else {
    	PREFIX = /usr/local
        target.path = $$INSTALLBASE$$PREFIX/lib
    }
    INSTALLS += target
}

headers.path = $$INSTALLBASE$$PREFIX/include/$${NAME}
headers.files = $$HEADERS
INSTALLS += headers
INSTALLDEPS += install_headers

