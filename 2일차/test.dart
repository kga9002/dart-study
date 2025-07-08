bool testNumber(var number) {
  var isTrue = true;

  return isTrue;
}

void main() {
  var numArr = [];
  for (var number = 2; number <= 50; number++) {
    bool isValid = true;
    for (var testnum = 2; testnum < number; testnum++) {
      if (number % testnum == 0) {
        isValid = false;
        break;
      }
    }
    if (isValid) numArr.add(number);
  }
  print(numArr);
}
