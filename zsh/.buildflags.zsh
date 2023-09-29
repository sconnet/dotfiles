#!/bin/zsh

#-----------------------------------------------------------------------------
# SUMMARY:
#    CFLAGS          C compiler
#    CPPFLAGS        Preprocessor and compiler
#    CXXFLAGS        C++ compiler
#    LDFLAGS         linker
#
# These are preferable as they are used by both clang, GCC, and MinGW:
#    CPATH               used by clang regardless of language
#    C_INCLUDE_PATH      used by clang for C language
#    CPLUS_INCLUDE_PATH  used by clang for C++ language
#    LIBRARY_PATH        used by clang
#
# LDFLAGS is for compiling
# LD_LIBRARY_PATH is for running executable to find dynamic linked library
# PKG_CONFIG_PATH auto-provides paths to includes and libs
#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------
# Both the GCC and Clang drivers respect the following environment variables:
#
# export CPATH=/usr/local/cuda/include
# export C_INCLUDE_PATH=/usr/local/cuda/include
# export CPLUS_INCLUDE_PATH=/usr/local/cuda/include
# export LIBRARY_PATH=/usr/local/opt/openssl@1.1/lib/
#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------
# CFLAGS, CXXFLAGS, CPPFLAGS, CPATH, C_INCLUDE_PATH, CPLUS_INCLUDE_PATH
# CFLAGS enables the addition of switches for the C compiler, while CXXFLAGS
# is meant to be used when invoking a C++ compiler. Similarly, a variable
# CPPFLAGS exists with switches to be passed to the C or C++ preprocessor.
#
# EXAMPLES:
# CPPFLAGS=-I/usr/include
# CFLAGS=-std=c99 -Wall
# CXXFLAGS=-Weffc++
#-----------------------------------------------------------------------------
CPATH+=/usr/local/opt/libffi/include:
CPATH+=/usr/local/opt/ncurses/include:
CPATH+=/usr/local/opt/readline/include:
CPATH+=/usr/local/opt/sqlite/include:
CPATH+=/usr/local/opt/tcl-tk/include:
CPATH+=/usr/local/opt/icu4c/include:
CPATH+=/usr/local/opt/openssl@1.1/include:
export CPATH

#-----------------------------------------------------------------------------
# LDFLAGS, LIBRARY_PATH
# Extra flags to give to compilers when they are supposed to invoke the
# linker, ‘ld’, such as -L. Libraries (-lfoo) should be added to the LDLIBS
# variable instead.
#
# This is used to find the libraries during link time during the build
# process.
#
# EXAMPLE:
# LDFLAGS=-L/usr/local/opt/lib
#-----------------------------------------------------------------------------
LIBRARY_PATH+=/usr/local/opt/libffi/lib:
LIBRARY_PATH+=/usr/local/opt/ncurses/lib:
LIBRARY_PATH+=/usr/local/opt/readline/lib:
LIBRARY_PATH+=/usr/local/opt/sqlite/lib:
LIBRARY_PATH+=/usr/local/opt/tcl-tk/lib:
LIBRARY_PATH+=/usr/local/opt/icu4c/lib:
LIBRARY_PATH+=/usr/local/opt/openssl@1.1/lib:
export LIBRARY_PATH

#-----------------------------------------------------------------------------
# PKG_CONFIG_PATH
# The pkg-config program is used to retrieve information about installed
# libraries in the system. It is typically used to compile and link against
# one or more libraries. Here is a typical usage scenario in a Makefile:
#
# EXAMPLE 1:
#  program: program.c
#     cc program.c `pkg-config --cflags --libs gnomeui`
#
# EXAMPLE 2:
#     gcc -o test test.c $(pkg-config --libs --cflags libpng)
#
# EXAMPLE 3:
# $ pkg-config --cflags --libs openssl
#
#    OUTPUT (not multiline):
#       -I/usr/local/Cellar/openssl@1.1/1.1.1j/include \
#       -L/usr/local/Cellar/openssl@1.1/1.1.1j/lib \
#       -lssl -lcrypto
#
# pkg-config retrieves information about packages from special metadata files.
# These files are named after the package, and has a .pc exten- sion. On most
# systems, pkg-config looks in /usr/lib/pkgconfig, /usr/share/pkgconfig,
# /usr/local/lib/pkgconfig and /usr/local/share/pkgconfig for these files. It
# will additionally look in the colon-separated (on Windows,
# semicolon-separated) list of directories specified by the PKG_CONFIG_PATH
# environment variable.
#
# pkg-config --variable pc_path pkg-config
#     /usr/local/lib/pkgconfig:
#     /usr/local/share/pkgconfig:
#     /usr/lib/pkgconfig:
#     /usr/local/Homebrew/Library/Homebrew/os/mac/pkgconfig/11.0:
#-----------------------------------------------------------------------------
PKG_CONFIG_PATH+=/usr/local/opt/libffi/lib/pkgconfig:
PKG_CONFIG_PATH+=/usr/local/opt/ncurses/lib/pkgconfig:
PKG_CONFIG_PATH+=/usr/local/opt/readline/lib/pkgconfig:
PKG_CONFIG_PATH+=/usr/local/opt/sqlite/lib/pkgconfig:
PKG_CONFIG_PATH+=/usr/local/opt/tcl-tk/lib/pkgconfig:
PKG_CONFIG_PATH+=/usr/local/opt/icu4c/lib/pkgconfig:
PKG_CONFIG_PATH+=/usr/local/opt/openssl@1.1/lib/pkgconfig:
export PKG_CONFIG_PATH

#-----------------------------------------------------------------------------
# LDLIBS
# Library flags or names given to compilers when they are supposed to invoke
# the linker, ‘ld’. LOADLIBES is a deprecated (but still supported)
# alternative to LDLIBS. Non-library linker flags, such as -L, should go in
# the LDFLAGS variable.
#
# EXAMPLE:
# LDLIBS=-lfoo -l -lssl
#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------
# LD_LIBRARY_PATH
# Variable contains a colon-separated list of directories that are searched by
# the dynamic linker when looking for a shared library to load. The
# directories are searched in the order they are mentioned in. If not
# specified, the linker uses the default, which is
# /lib:/usr/lib:/usr/local/lib.
#
# This is used for paths to find the library when running a dynamically linked
# executable. It has nothing to do with compiling.
#-----------------------------------------------------------------------------

