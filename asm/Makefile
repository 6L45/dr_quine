# asm/Makefile

# Assembleur et options
ASM = nasm
ASMFLAGS = -f elf64

# Liste des fichiers sources et objets
SRC = colleen/Colleen.s grace/Grace.s sully/Sully.s
OBJ = $(SRC:.s=.o)

# Cibles exécutables
EXE = colleen/Colleen grace/Grace sully/Sully

FLAGS = -Wall -Werror -Wextra

# Cible par défaut : compile tout
all: $(EXE)

# Règles pour les exécutables (utilisation de gcc pour inclure la libc)
colleen/colleen: colleen/Colleen.o
	gcc $(FLAGS) $< -o $@

grace/grace: grace/Grace.o
	gcc $(FLAGS) $< -o $@

sully/sully: sully/Sully.o
	gcc $(FLAGS) $< -o $@

# Règles de compilation pour chaque fichier objet
%.o: %.s
	$(ASM) $(ASMFLAGS) $< -o $@

# Nettoyage des fichiers objets et exécutables
clean:
	rm -f $(OBJ) $(EXE)

