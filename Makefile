SHELL = /bin/sh
CC=gcc
CXXFLAGS=`fltk-config --cxxflags` -Wall -Wextra -std=c++11 -c
LDFLAGS=`fltk-config --ldflags`
BUILDDIR=build

.PHONY: all clean cleanall dirs debug-dirs common info
.DEFAULT_GOAL := all

all: $(BUILDDIR)/fltk-gui

# This is probably going to be needed by a lot of targets
common: info dirs

build/obj/fltk-gui.o: src/fltk-gui.cpp
	$(shell g++ $(CXXFLAGS) $(OSFLAG) src/fltk-gui.cpp -o build/obj/fltk-gui.o)

build/fltk-gui: common build/obj/fltk-gui.o
	$(shell g++ build/obj/fltk-gui.o -o build/fltk-gui $(LDFLAGS))

# Build but keep intermediate files
#debug: dirs debug-dirs
#	$(shell g++ -save-temps=obj -std=c++11 `fltk-config --cxxflags` src/fltk-gui.cpp `fltk-config --ldflags` -o build/fltk-gui)
#	mv $(BUILDDIR)/*.bc $(BUILDDIR)/bc/
#	mv $(BUILDDIR)/*.ii $(BUILDDIR)/ii/
#	mv $(BUILDDIR)/*.o $(BUILDDIR)/o/
#	mv $(BUILDDIR)/*.s $(BUILDDIR)/s/

clean:
	rm -rf $(BUILDDIR)/

# Setup directories
dirs: $(BUILDDIR)
$(BUILDDIR):
	mkdir -p $(BUILDDIR)/obj
#debug-dirs: dirs
#	mkdir -p $(BUILDDIR)/bc $(BUILDDIR)/ii $(BUILDDIR)/obj $(BUILDDIR)/s