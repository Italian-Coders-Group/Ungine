
.PHONY: all clean

CC = g++

# linux paths
HEADER_DIRECTORY_LINUX  = ./Ungine/3rdparty/raylib-3.5.0_linux_amd64/include
LIBRARY_DIRECTORY_LINUX = ./Ungine/3rdparty/raylib-3.5.0_linux_amd64/lib
# windows paths
HEADER_DIRECTORY_WIN= ./Ungine/3rdparty/raylib-3.5.0_win64_msvc16/include
LIBRARY_DIRECTORY_WIN = ./Ungine/3rdparty/raylib-3.5.0_win64_msvc16/lib

FLAGS_LINUX = -lraylib -lglfw -lrt -lm -ldl -lX11 -lpthread -lxcb -lXau -lXdmcp
FLAGS_WIN = -lpthread

all: build build/ungine build/libraylib.so.350

build:
	mkdir ./build

build/ungine: src/main.cpp
	ifeq ($(OS),Windows_NT)
		$(CC) src/main.cpp -o build/ungine -I$(HEADER_DIRECTORY_WIN) -L$(LIBRARY_DIRECTORY_WIN) $(FLAGS) -Wl,-rpath=./
	else ifeq ($(shell uname), Linux)
		$(CC) src/main.cpp -o build/ungine -I$(HEADER_DIRECTORY_LINUX) -L$(LIBRARY_DIRECTORY_LINUX) $(FLAGS_LINUX) -Wl,-rpath=./
	else
		$(error Not Supported!)
	endif
build/libraylib.so.350: $(LIBRARY_DIRECTORY)/libraylib.so.350
	cp $(LIBRARY_DIRECTORY)/libraylib.so.350 build/libraylib.so.350

clean:
	rm -rf ./build