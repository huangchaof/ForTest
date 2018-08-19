#include "mysql.h"
#include "mysqld_error.h"
#include<stdio.h>
#include <WinSock.h>
#include <iostream>
MYSQL  mysql;
using namespace std;
int main()
{
	mysql_init(&mysql);
	mysql_real_connect(&mysql, "localhost", "root", "01253840", "hcf", 3306, NULL, 0);
	printf("Error connecting to database:%s\n", mysql_error(&mysql));
	char * sql = "select *from persons";
	mysql_query(&mysql, sql);
	MYSQL_RES *result = mysql_store_result(&mysql);
	int num_fields = mysql_num_fields(result);
	MYSQL_FIELD *fields = mysql_fetch_fields(result);
	for (int i = 0; i < num_fields; i++)
	{
		cout << "field " << i << " name is " << fields[i].name << endl;
	}
}
