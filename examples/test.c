#include <stdio.h>
#include <unistd.h>

int main() {
  int x = 5;
  while (1) {
    sleep(5);
    x++;
    printf("This is a test %d\n", x);
  }
}
