CC = gcc
#Using -Ofast instead of -O3 might result in faster code, but is supported only by newer GCC versions
CFLAGS = -lm -O3 -march=native -Wall -funroll-loops -Wno-unused-result -DNDEBUG

all: word2vec word2phrase distance word-analogy compute-accuracy

word2vec : word2vec.c
	$(CC) word2vec.c -o word2vec $(CFLAGS) -pthread
word2phrase : word2phrase.c
	$(CC) word2phrase.c -o word2phrase $(CFLAGS)
distance : distance.c
	$(CC) distance.c -o distance $(CFLAGS)
word-analogy : word-analogy.c
	$(CC) word-analogy.c -o word-analogy $(CFLAGS)
compute-accuracy : compute-accuracy.c
	$(CC) compute-accuracy.c -o compute-accuracy $(CFLAGS)
word2vec-blas : word2vec.c
	$(CC) word2vec.c -o word2vec-blas $(CFLAGS) -pthread -DHAVE_CBLAS=1 -lopenblas

clean:
	rm -f word2vec word2vec-blas word2phrase distance word-analogy compute-accuracy
	rm -f word2vec.exe word2vec-blas.exe word2phrase.exe distance.exe word-analogy.exe compute-accuracy.exe
