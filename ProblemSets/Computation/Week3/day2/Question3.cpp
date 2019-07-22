// Question 3
#include <iostream>
#include<cmath>
#include <complex>


int main()
{
    using namespace std;
    double a, b,c;
    cout << "Will solve: ax**2 + bx + c = 0";
    cout << "enter a, b, c" << endl;
    cin >> a >> b >> c;
    complex<double> disc =pow(b, 2) - 4 * a * c;
    cout << "Solutions:" << endl;
    cout << (-b + sqrt(disc)) / (2 * a) << endl;
    cout << (-b - sqrt(disc)) / (2 * a) << endl;
}
