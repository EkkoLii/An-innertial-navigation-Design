CC = g++
LIB = lib/
SRC = src/
INCLUDE = include/

.PHONY: all
all: liblsm9ds1.so

liblsm9ds1.so: $(SRC)LSM9DS1.cpp
	mkdir -p $(LIB)
	$(CC) -I$(INCLUDE) -Wall -O2 $(SRC)LSM9DS1.cpp -lwiringPi -shared -o $(LIB)liblsm9ds1.so

wrapper: $(SRC)
	mkdir -p $(LIB)
	$(CC) -I$(INCLUDE) -Wall -O2 -fPIC -c $(SRC)LSM9DS1.cpp -o LSM9DS1.o
	$(CC) -I$(INCLUDE) -Wall -O2 -fPIC -c $(SRC)LSM9DS1_c_wrapper.cpp -o LSM9DS1_c_wrapper.o
	$(CC) -I$(INCLUDE) -Wall -O2 -shared LSM9DS1.o LSM9DS1_c_wrapper.o -o $(LIB)liblsm9ds1cwrapper.so