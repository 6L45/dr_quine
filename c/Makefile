# c/Makefile

# Compilateur et options
CC = gcc
CFLAGS = -Wall -Wextra -Werror

# Liste des fichiers sources et objets
SRC = colleen/colleen.c grace/grace.c sully/sully_5.c
OBJ = $(SRC:.c=.o)

# Cibles exécutables
EXE = colleen/colleen grace/grace sully/sully_5

# Cible par défaut : compile tout
all: $(EXE)

# Règles pour les exécutables
colleen/colleen: colleen/colleen.o
	$(CC) $< -o $@

grace/grace: grace/grace.o
	$(CC) $< -o $@

sully/sully_5: sully/sully_5.o
	$(CC) $< -o $@

# Règles de compilation pour chaque fichier objet
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Nettoyage des fichiers objets et exécutables
clean:
	rm -f $(OBJ) $(EXE)

