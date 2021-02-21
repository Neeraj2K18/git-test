#include<iostream>
using namespace std;
int add(int&,int&);

int main()
{
int a=2,b=3;
int result=add(a,b);
cout<<"\nThe Sum is:: "<<result<<endl;

a=1,b=0;
int result1=a+b;
cout<<"The sum in main is"<<result1<<endl;

return 0;
}


int add(int &x, int &y)
{
return (x+y);
}
