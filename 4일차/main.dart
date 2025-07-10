class Integer {
  late int _value;

  Integer([int givenValue = 0]) : _value = givenValue;

  int get() {
    return _value;
  }

  set changeInteger(int givenNumber) {
    _value = givenNumber;
  }

  String get asString => '$_value';

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

class NewInteger extends Integer {
  List<int> _list = [];

  NewInteger([int givenValue = 0]) {
    _value = givenValue;
  }

  @override
  set changeInteger(int givenValue) {
    _list.add(givenValue);
    super.changeInteger = givenValue;
  }

  @override
  String get asString => '현재 값: $_value, 기존에 지정했던 값들: $_list';

  List getOld() {
    return _list;
  }
}

void main() {
  var newNum1 = NewInteger();
  var newNum2 = NewInteger(3);

  newNum1.changeInteger = 9;
  newNum1.changeInteger = 6;
  print(newNum1.asString);
}
