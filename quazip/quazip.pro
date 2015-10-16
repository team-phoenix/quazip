TEMPLATE = lib
CONFIG += qt warn_on staticlib static
CONFIG -= shared dll
QT -= gui
VERSION = 1.0.0

DEFINES += QUAZIP_BUILD
CONFIG( staticlib ): DEFINES += QUAZIP_STATIC

# Input
include( quazip.pri )

LIBS += -lz

win32 {
    CONFIG( debug, debug|release ) {
        OBJECTS_DIR = debug/.obj
        MOC_DIR = debug/.moc
    }

    CONFIG( release, debug|release ) {
        OBJECTS_DIR = release/.obj
        MOC_DIR = release/.moc
    }
}
else {
    OBJECTS_DIR = .obj
    MOC_DIR = .moc
}

# workaround for qdatetime.h macro bug
win32: DEFINES += NOMINMAX

macx: QMAKE_MAC_SDK = macosx10.11

QMAKE_EXTRA_TARGETS += portable
