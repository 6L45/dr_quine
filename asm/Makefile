# asm/Makefile

# Assembleur et options
ASM = nasm
ASMFLAGS = -f elf64

# Liste des fichiers sources et objets
SRC = colleen/colleen.s grace/grace.s sully/sully_5.s
OBJ = $(SRC:.s=.o)

# Cibles exécutables
EXE = colleen/colleen grace/grace sully/sully

FLAGS = -Wall -Werror -Wextra

# Cible par défaut : compile tout
all: $(EXE)

# Règles pour les exécutables (utilisation de gcc pour inclure la libc)
colleen/colleen: colleen/colleen.o
	gcc $(FLAGS) $< -o $@

grace/grace: grace/grace.o
	gcc $(FLAGS) $< -o $@

sully/sully: sully/sully_5.o
	gcc $(FLAGS) $< -o $@

# Règles de compilation pour chaque fichier objet
%.o: %.s
	$(ASM) $(ASMFLAGS) $< -o $@

# Nettoyage des fichiers objets et exécutables
clean:
	rm -f $(OBJ) $(EXE)

