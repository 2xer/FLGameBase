SHELL = /bin/sh
CC=gcc
CFLAGS=-Wall -Wextra
BUILDDIR=build
NAME=fltk-gui

.PHONY: all clean cleanall debug dirs debug-dirs
.DEFAULT_GOAL := all

all: $(BUILDDIR)/$(NAME)

build/$(NAME): dirs
	$(shell g++ -std=c++11 `fltk-config --cxxflags` src/fltk-gui.cpp `fltk-config --ldflags` -o build/$(NAME))

# Build but keep intermediate files
debug: dirs debug-dirs
	$(shell g++ -save-temps=obj -std=c++11 `fltk-config --cxxflags` src/fltk-gui.cpp `fltk-config --ldflags` -o build/$(NAME))
	mv $(BUILDDIR)/*.bc $(BUILDDIR)/bc/
	mv $(BUILDDIR)/*.ii $(BUILDDIR)/ii/
	mv $(BUILDDIR)/*.o $(BUILDDIR)/o/
	mv $(BUILDDIR)/*.s $(BUILDDIR)/s/

clean:
	rm -rf $(BUILDDIR)/

# Setup directories
dirs: $(BUILDDIR)
$(BUILDDIR):
	mkdir -p $(BUILDDIR)
debug-dirs: dirs
	mkdir -p $(BUILDDIR)/bc $(BUILDDIR)/ii $(BUILDDIR)/o $(BUILDDIR)/s