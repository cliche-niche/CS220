#include <bits/stdc++.h>

using namespace std;

int main(){

    int n=300;

    while(n--){
        int inp, m;
        cin>>inp;
        m = inp;

        int pri=0;

        while(inp){
            if(inp%10){
                break;
            }else{
                pri++;
                inp /= 10;
            }
        }

        int x;
        cin>>x;

        if(x != pri){
            cout<<"False for "<<m<<" and "<<pri;
        }
    }

    return 0;
}