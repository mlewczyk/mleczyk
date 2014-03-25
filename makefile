# Mleczyk
TARGET = mleczyk
CC = mingw32-gcc

.PHONY: default all clean

OBJ =\
	main.o \
	foo.o

default: $(TARGET)
all: default

OBJECTS = $(patsubst %.c, %.o, $(wildcard *.c))
HEADERS = $(wildcard *.h)

%.o: %.c $(HEADERS)
	$(CC) -c $< -o $@

.PRECIOUS: $(TARGET) $(OBJECTS)

$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) -o $@

clean:
	del *.o *.exe