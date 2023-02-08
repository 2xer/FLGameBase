SHELL = /bin/sh
CC=gcc
CFLAGS=-Wall -Wextra

.PHONY: all clean cleanall
.DEFAULT_GOAL := all

all: build/fltk-gui

build/fltk-gui:
	$(shell g++ -std=c++11 `fltk-config --cxxflags` src/fltk-gui.cpp `fltk-config --ldflags` -o build/fltk-gui)

clean:
	rm build/fltk-gui