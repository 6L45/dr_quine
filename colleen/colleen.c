#include <stdio.h>

	/*
	USELESS OUTSIDE COMMENT
	*/

void quine_me(char *str)
{
	/*
	USELESS INSIDE COMMENT
	*/
	printf(str, 10, 10, 9, 10, 9, 10, 9, 10, 10, 10, 10, 9, 10, 9, 10, 9, 10, 9, 10, 10, 10, 10, 10, 9, 34, str, 34, 10, 9, 10, 9, 10, 10);
}

int main()
{
	char *str = "#include <stdio.h>%c%c%c/*%c%cUSELESS OUTSIDE COMMENT%c%c*/%c%cvoid quine_me(char *str)%c{%c%c/*%c%cUSELESS INSIDE COMMENT%c%c*/%c%cprintf(str, 10, 10, 9, 10, 9, 10, 9, 10, 10, 10, 10, 9, 10, 9, 10, 9, 10, 9, 10, 10, 10, 10, 10, 9, 34, str, 34, 10, 9, 10, 9, 10, 10);%c}%c%cint main()%c{%c%cchar *str = %c%s%c;%c%cquine_me(str);%c%Creturn 0;%c}%c";
	quine_me(str);
	return 0;
}
