int getMax(int num1, int num2) {
  if (num1 > num2)
    return num1;
  else if (num1 == num2)
    return -1;
  else
    return num2;
}

void hello() {
  print("hello");
}

void createPlayer({required String name, int level = 1, double exp = 0.0}) {}

void main() {
  hello();
}
