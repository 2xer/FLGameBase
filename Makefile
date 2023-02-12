SHELL = /bin/sh
CC=gcc
CXXFLAGS=`fltk-config --cxxflags` -Wall -Wextra -std=c++11
LDFLAGS=`fltk-config --ldflags`
BUILDDIR=build

.PHONY: all clean dirs debug-dirs
.DEFAULT_GOAL := all

all: $(BUILDDIR)/fltk-gui

build/obj/fltk-gui.o: src/fltk-gui.cpp
	$(shell g++ $(CXXFLAGS) -c src/fltk-gui.cpp -o build/obj/fltk-gui.o)

build/fltk-gui: dirs build/obj/fltk-gui.o
	$(shell g++ build/obj/fltk-gui.o -o build/fltk-gui $(LDFLAGS))

# Build but keep all intermediate files
debug: debug-dirs
	$(shell g++ -save-temps=obj $(CXXFLAGS) src/fltk-gui.cpp $(LDFLAGS) -o build/fltk-gui)
	mv $(BUILDDIR)/*.bc $(BUILDDIR)/bc/
	mv $(BUILDDIR)/*.ii $(BUILDDIR)/ii/
	mv $(BUILDDIR)/*.o $(BUILDDIR)/obj/
	mv $(BUILDDIR)/*.s $(BUILDDIR)/s/

clean:
	rm -rf $(BUILDDIR)

# Setup directories
dirs: $(BUILDDIR)
$(BUILDDIR):
	mkdir -p $(BUILDDIR)/obj
debug-dirs: $(BUILDDIR)
	mkdir -p $(BUILDDIR)/bc $(BUILDDIR)/ii $(BUILDDIR)/obj $(BUILDDIR)/s