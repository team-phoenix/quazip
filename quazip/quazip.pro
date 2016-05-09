##
## Extra targets
##

    QMAKE_EXTRA_TARGETS += portable

##
## Qt settings
##

    TEMPLATE = lib
    CONFIG += qt warn_on staticlib static
    CONFIG -= shared dll

    # Undefine this (for some reason it's on by default on Windows)
    CONFIG -= debug_and_release debug_and_release_target

    QT -= gui
    VERSION = 1.0.0

##
## Compiler settings
##

    DEFINES += QUAZIP_BUILD
    CONFIG( staticlib ): DEFINES += QUAZIP_STATIC

    # Build with debugging info
    DEFINES += QT_MESSAGELOGCONTEXT

    # workaround for qdatetime.h macro bug
    win32: DEFINES += NOMINMAX

    # FIXME: Remove once newer Qt versions make this unnecessary
    macx: QMAKE_MAC_SDK = macosx10.11

    # Input
    include( quazip.pri )

    OBJECTS_DIR = obj
    MOC_DIR = moc

##
## Linker settings
##

    LIBS += -lz
