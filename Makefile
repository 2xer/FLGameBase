SHELL = /bin/sh
CC=gcc
CFLAGS=-Wall -Wextra
BUILDDIR=build

OSFLAG 				:=
ifeq ($(OS),Windows_NT)
	OSFLAG = -D OS_GENERIC
	OS = generic
else
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S),Darwin)
		OSFLAG = -D OSX
		OS = OSX
	else
		OSFLAG = -D OS_GENERIC
		OS = generic
	endif
endif

.PHONY: all clean cleanall debug dirs debug-dirs common info
.DEFAULT_GOAL := all

all: $(BUILDDIR)/fltk-gui

# Build platform independent object files
common: info dirs
	$(shell g++ -c -std=c++11 $(OSFLAG) `fltk-config --cxxflags` src/fltk-gui.cpp -o build/obj/fltk-gui.o)

# Link platform independent object files
build/fltk-gui: common
	$(shell g++ -std=c++11 build/obj/fltk-gui.o `fltk-config --ldflags` -o build/fltk-gui)

# Build and link MacOS object files
build/fltk-gui-macos: common
	$(shell gcc -c src/objc.m -o build/obj/objc.o)
	$(shell g++ -std=c++11 build/obj/fltk-gui.o build/obj/objc.o -o build/fltk-gui-macos `fltk-config --ldflags` -framework AppKit)

# Build but keep intermediate files
#debug: dirs debug-dirs
#	$(shell g++ -save-temps=obj -std=c++11 `fltk-config --cxxflags` src/fltk-gui.cpp `fltk-config --ldflags` -o build/fltk-gui)
#	mv $(BUILDDIR)/*.bc $(BUILDDIR)/bc/
#	mv $(BUILDDIR)/*.ii $(BUILDDIR)/ii/
#	mv $(BUILDDIR)/*.o $(BUILDDIR)/o/
#	mv $(BUILDDIR)/*.s $(BUILDDIR)/s/

clean:
	rm -rf $(BUILDDIR)/

info:
	@echo OS: $(OS)

# Setup directories
dirs: $(BUILDDIR)
$(BUILDDIR):
	mkdir -p $(BUILDDIR)/obj
debug-dirs: dirs
	mkdir -p $(BUILDDIR)/bc $(BUILDDIR)/ii $(BUILDDIR)/obj $(BUILDDIR)/s