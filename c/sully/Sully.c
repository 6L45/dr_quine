#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>

int	main()
{
	int i = 5;
	if (i < 0)
		return 0;
	char file[10] = {0};
	sprintf(file, "Sully_%d.c", i);
	int fd = open(file, O_RDWR | O_CREAT, 0644);
	if (fd < 0)
		return 1;

	char *str = "#include <stdio.h>%3$c#include <unistd.h>%3$c#include <fcntl.h>%3$c#include <stdlib.h>%3$c%3$cint%2$cmain()%3$c{%3$c%2$cint i = %6$d;%3$c%2$cif (i < 0)%3$c%2$c%2$creturn 0;%3$c%2$cchar file[10] = {0};%3$c%2$csprintf(file, %4$cSully_%%d.c%4$c, i);%3$c%2$cint fd = open(file, O_RDWR | O_CREAT, 0644);%3$c%2$cif (fd < 0)%3$c%2$c%2$creturn 1;%3$c%3$c%2$cchar *str = %4$c%1$s%4$c;%3$c%2$cdprintf(fd, str, str, 9, 10, 34, i, i - 1);%3$c%2$cchar cmd[40] = {0};%3$c%2$csprintf(cmd, %4$cgcc %%s -o Sully_%%d && ./Sully_%%d%4$c, file, i, i);%3$c%2$csystem(cmd);%3$c%2$creturn 0;%3$c}%3$c";
	dprintf(fd, str, str, 9, 10, 34, i, i - 1);
	char cmd[40] = {0};
	sprintf(cmd, "gcc %s -o Sully_%d && ./Sully_%d", file, i, i);
	system(cmd);
	return 0;
}
