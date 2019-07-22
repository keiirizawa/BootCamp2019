//
//  Question4.cpp
//  
//
//  Created by Kei Irizawa on 7/19/19.
//
#include <iostream>
#include<cmath>
#include <stdio.h>
#include "Question4.hpp"

double solve_pi(int N){
    double integ, x, i;
    for (i=0; i < N; i++){
        x = i * 1 / N;
        integ += float((4 / (1 + pow(x,2)) ) * 1 / N);
    }
    return integ;
}


int main()
{
    using namespace std;
    int N;
    double integ;
    cout << "Please provide N:" << endl;
    cin >> N;
    integ = solve_pi(N);
    cout << integ;
    return 0;
}
