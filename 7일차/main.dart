import 'dart:io';
import 'dart:async';
import 'dart:math';

void main() {
  //   List<String> fruits = ["Apple is Red", "  Banana  ", "Mango"];
  //   print("[1] Mango in List ? : ${fruits.contains("Mango")}");
  //   print("[1] Starts with Apple ? : ${fruits[0].startsWith("Apple")}");
  //   print("[1] Ends with Red ? : ${fruits[0].endsWith("Red")}");
  //   print("[1] Index of Red ? : ${fruits.indexOf("Red")}");
  //   print("[1] Trim '  Banana  ' ? : ${fruits[1].trim()}");

  //   // Platform - dart:io

  //   String os = Platform.operatingSystem;
  //   String path = Platform.script.toFilePath();
  //   print("OS : $os");
  //   print("Source File : $path");

  //   // dart:math
  //   print("[3] max(2,4) : ${max(2, 4)}");
  //   print("[3] min(2,4) : ${min(2, 4)}");
  //   print("[3] e : {$e}");
  //   print("[3] pi : $pi");

  var t1 = DateTime.now();
  Future<int> async1() async {
    print("async1() : 1second left");
    await Future.delayed(Duration(seconds: 1));
    print("async1() : finished");
    return 10;
  }

  Future<int> async2() async {
    print("async2() : 2second left");
    await Future.delayed(Duration(seconds: 1));
    print("async2() : 1second left");
    await Future.delayed(Duration(seconds: 1));
    print("async2() : finished");
    return 20;
  }

  Future<int> async3() async {
    print("async3() : 3second left");
    await Future.delayed(Duration(seconds: 1));
    print("async3() : 2second left");
    await Future.delayed(Duration(seconds: 1));
    print("async3() : 1second left");
    await Future.delayed(Duration(seconds: 1));
    print("async3() : finished");
    return 20;
  }

  Future.wait([async1(), async2(), async3()])
      .then((List<int> nums) {
        var t2 = DateTime.now();

        var sum = nums.reduce((curr, next) => curr + next);
        print("sum : $sum < Time : ${t2.difference(t1)} > ");
      })
      .catchError(print);
}
