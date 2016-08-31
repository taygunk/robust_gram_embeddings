CC = gcc
#Using -Ofast instead of -O3 might result in faster code, but is supported only by newer GCC versions
CFLAGS = -lm -pthread -O3 -march=native -Wall -funroll-loops -Wno-unused-result

all: robust_gram

robust_gram : robust_gram.c
	$(CC) robust_gram.c -o robust_gram $(CFLAGS)
clean:
	rm -rf robust_gram
