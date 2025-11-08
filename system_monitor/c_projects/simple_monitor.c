#include<stdio.h>
#include<math.h>
#include<stdlib.h>
int main()
{
	printf("=== 系统管理监测 ===\n");
	printf("\n当前时间：\n");
	fflush(stdout);
	system("date");

	printf("\n--- 内存使用 ---\n");
	fflush(stdout);
	system("free -h | head -2");

	printf("\n--- 磁盘空间 ---\n");
	fflush(stdout);
	system("df -h | grep -v tmpfs");

	printf("\n--- 系统运行状态 ---\n");
	fflush(stdout);
	system("uptime");

	printf("\n--- nginx运行状态 ---\n");
	fflush(stdout);
	system("systemctl is-active nginx");
	return 0;
}
