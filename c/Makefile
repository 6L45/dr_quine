# c/Makefile

# Compilateur et options
CC = gcc
CFLAGS = -Wall -Wextra -Werror

# Liste des fichiers sources et objets
SRC = colleen/Colleen.c grace/Grace.c sully/Sully.c
OBJ = $(SRC:.c=.o)

# Cibles exécutables
EXE = colleen/Colleen grace/Grace sully/Sully

# Cible par défaut : compile tout
all: $(EXE)

# Règles pour les exécutables
colleen/colleen: colleen/Colleen.o
	$(CC) $< -o $@

grace/grace: grace/Grace.o
	$(CC) $< -o $@

sully/sully_5: sully/Sully.o
	$(CC) $< -o $@

# Règles de compilation pour chaque fichier objet
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Nettoyage des fichiers objets et exécutables
clean:
	rm -f $(OBJ) $(EXE)

