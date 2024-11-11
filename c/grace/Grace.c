#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>

// youhou

#define FT_KID(fd, str)	dprintf(fd, str, str, 9, 10, 34)
#define FT_MAIN(x)	int main() {int fd = open("Grace_kid.c", O_WRONLY | O_CREAT | O_TRUNC, 0644); if(fd < 0) return 1; FT_KID(fd, STR); close(fd); return 0;}
#define STR		"#include <stdio.h>%3$c#include <unistd.h>%3$c#include <fcntl.h>%3$c%3$c// youhou%3$c%3$c#define FT_KID(fd, str)%2$cdprintf(fd, str, str, 9, 10, 34)%3$c#define FT_MAIN(x)%2$cint main() {int fd = open(%4$cGrace_kid.c%4$c, O_WRONLY | O_CREAT | O_TRUNC, 0644); if(fd < 0) return 1; FT_KID(fd, STR); close(fd); return 0;}%3$c#define STR%2$c%2$c%4$c%1$s%4$c%3$c%3$cFT_MAIN(STR)%3$c"

FT_MAIN(STR)
