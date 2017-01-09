#include <Windows.h>
#include <stdlib.h>
#include <stdio.h>

int main(int argc, char *argv[])
{
	//Get steam path
	char value[255];
	DWORD bufferSize = 8192;
	RegGetValue(HKEY_CURRENT_USER, "Software\\Valve\\Steam", "SteamExe", RRF_RT_REG_SZ, NULL, (PVOID)&value, &bufferSize);

	char command[300];
	strcpy(command, "\"\"");
	strcat(command, value);
	strcat(command, "\" -applaunch 420530\"");

	printf("Steam path found: %s\n\n", value);

	if (system(command))
	{
		printf("\nDidn't work, report to Jokie.\n\nPress any key...");
		getchar();
	}
}