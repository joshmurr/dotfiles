CC = g++
LD = g++

INCDIR = -I/opt/local/include/SDL2
CFLAGS = -g -Wall -c $(INCDIR)
LDFLAGS = -g -Wall -w -lSDL2

all: SDL_Blank

SDL_Blank: main.o screen.o
	$(LD) $(LDFLAGS) $^ -o $@

screen.o: screen.cpp screen.h
	$(CC) $(CFLAGS) $<

clean:
	/bin/rm -f SDL_Blank *.o core*
