class Integer {
  late int _val;

  Integer([int givenVal = 0]) : _val = givenVal;

  int get getVal => _val;

  set setVal(int givenVal) => _val = givenVal;
}

class GoodInteger extends Integer {
  List _goodList = [];

  GoodInteger([int givenVal = 0]) {
    _val = givenVal;
  }

  @override
  set setVal(int givenVal) {
    _goodList.add(givenVal);
    super.setVal = givenVal;
  }

  List get getList => _goodList;
}

void main() {
  var num1 = GoodInteger(3);
  print(num1.getList);
  num1.setVal = 5;
  print(num1.getList);
  num1.setVal = 7;
  print(num1.getList);
}
