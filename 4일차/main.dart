class Integer {
  late int _value;

  Integer(int givenNumber) {
    _value = givenNumber;
  }

  int get() {
    return _value;
  }

  set changeInteger(int givenNumber) {
    _value = givenNumber;
  }

  Integer operator +(Integer givenValue) {
    return Integer(_value + givenValue.get());
  }

  Integer operator -(Integer givenValue) {
    return Integer(_value - givenValue.get());
  }

  Integer operator *(Integer givenValue) {
    return Integer(_value * givenValue.get());
  }

  Integer operator ~/(Integer givenValue) {
    return Integer(_value ~/ givenValue.get());
  }

  double operator /(Integer givenValue) {
    return _value / givenValue.get();
  }
}

void main() {
  var num1 = Integer(5);
  var num2 = Integer(10);

  var num3 = num1 + num2;
  var num4 = num1 ~/ num2;
  var num5 = num1 * num2;
  var num6 = num1 / num2;

  print(num3.get());
  print(num4.get());
  print(num5.get());
  print(num6);
}
