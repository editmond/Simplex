#include <iostream>

int main (int argc, char *argv[]) {
  int fibIndex = 5; //set this to change the largest term of fibonacci found
  int i = 2;
  int x = 1;
  int y = 1;
  std::cout << x << "\n";
  std::cout << y << "\n";
  while (i <= fibIndex){
    int temp = x+y;
    std::cout << temp << "\n";
    y = x;
    x = temp;
    i += 1;
  } 

  return 0;
}
