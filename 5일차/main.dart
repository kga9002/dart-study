// void main()  {
//   print(1 + 1);

//    Future.delayed(Duration(seconds: 1), () => print("hello"));
//   print(2 + 2);
// }

doBG(int time, Flag finished) {
  if (time > 0) {
    print("$time 초 남았습니다");
    Future.delayed(Duration(seconds: 1), () => doBG(time - 1, finished));
  } else {
    print("밥준비완.");
    finished.activated = true;
  }
}

class Flag {
  late bool _flag;

  Flag(bool givenFlag) : _flag = givenFlag;
  bool get activated => _flag;
  set activated(bool givenFlag) => _flag = givenFlag;
}

void main() async {
  var finished = Flag(false);
  print("order");
  await doBG(5, finished);
  while (!finished.activated) {
    await Future.delayed(Duration(seconds: 1));
  }
  print("eat");
}
