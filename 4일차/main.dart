class Integer {
  late int _value;

  Integer([int givenNumber = 0]) {
    _value = givenNumber;
  }

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

class NewInteger extends Integer with ActivationFlag {
  List<int> _list = [];

  NewInteger([int givenValue = 0]) {
    _value = givenValue;
  }

  @override
  set changeInteger(int givenValue) {
    if (activated == true) {
      _list.add(givenValue);
      print("set 함수 실행됨. 현재 저장된 결과는 $_list임");
    } else {
      print("set함수 실행 안함");
    }
    super.changeInteger = givenValue;
  }

  @override
  String get asString => '현재 값: $_value, 기존에 지정했던 값들: $_list';

  List getOld() {
    return _list;
  }
}

mixin ActivationFlag on Integer {
  bool _flag = true;
  bool get activated => _flag;
  set activated(bool givenFlag) => (_flag = givenFlag);
}
void main() {
  var num1 = NewInteger();

  num1.changeInteger = 2;
  num1.changeInteger = 4;

  num1.activated = false;

  num1.changeInteger = 6;
  num1.changeInteger = 8;
}
