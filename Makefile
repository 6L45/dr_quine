# Makefile principal
.PHONY: all c asm clean

all: c asm  # Compile tout le projet

c:
	$(MAKE) -C c        # Appel au makefile de C

asm:
	$(MAKE) -C asm      # Appel au makefile d'assembleur

clean:
	$(MAKE) -C c clean  # Nettoyage des fichiers C
	$(MAKE) -C asm clean  # Nettoyage des fichiers assembleur

