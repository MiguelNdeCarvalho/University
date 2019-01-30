/*
Author: Miguel de Carvalho
Date: 29/11/2018
*/

#include <stdio.h>


_Bool verifica_ordem(int vec[], int sz){
	int i;
	_Bool aux;
	aux=1;
	for(i=1; i<sz ; i++)
	{
		if(vec[i]>vec[i+1]){
			aux=0;
		}
	}
	return aux;
}


int main()
{
 //int vec[] = {3,15,10}; //Just to test
 return verifica_ordem (vec , 3);
}
