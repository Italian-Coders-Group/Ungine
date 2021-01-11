
.PHONY: all clean

CC = g++

HEADER_DIRECTORY  = ./Ungine/3rdparty/raylib-3.5.0_linux_amd64/include
LIBRARY_DIRECTORY = ./Ungine/3rdparty/raylib-3.5.0_linux_amd64/lib
FLAGS = -lraylib -lglfw -lrt -lm -ldl -lX11 -lpthread -lxcb -lXau -lXdmcp

all: build build/ungine build/libraylib.so.350

build:
	mkdir ./build

build/ungine: src/main.cpp
	$(CC) src/main.cpp -o build/ungine -I$(HEADER_DIRECTORY) -L$(LIBRARY_DIRECTORY) $(FLAGS) -Wl,-rpath=./

build/libraylib.so.350: $(LIBRARY_DIRECTORY)/libraylib.so.350
	cp $(LIBRARY_DIRECTORY)/libraylib.so.350 build/libraylib.so.350

clean:
	rm -rf ./build