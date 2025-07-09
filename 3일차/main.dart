class Integer {
  late int _value;

  Integer([int givenVal = 0]) {
    _value = givenVal;
  }

  set value(int givenValue) => _value = givenValue;
}

class TimemachineInteger extends Integer {}

void main() {}
