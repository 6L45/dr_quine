# asm/Makefile

# Assembleur et options
ASM = nasm
ASMFLAGS = -f elf64

# Liste des fichiers sources et objets
SRC = colleen/colleen.s grace/grace.s sully/sully.s
OBJ = $(SRC:.s=.o)

# Cibles exécutables
EXE = colleen/colleen grace/grace sully/sully

# Cible par défaut : compile tout
all: $(EXE)
	@echo "Compilation des fichiers assembleur terminée."

# Règles pour les exécutables (utilisation de gcc pour inclure la libc)
colleen/colleen: colleen/colleen.o
	gcc -no-pie $< -o $@

grace/grace: grace/grace.o
	gcc -no-pie $< -o $@

sully/sully: sully/sully.o
	gcc -no-pie $< -o $@

# Règles de compilation pour chaque fichier objet
%.o: %.s
	$(ASM) $(ASMFLAGS) $< -o $@

# Nettoyage des fichiers objets et exécutables
clean:
	rm -f $(OBJ) $(EXE)

