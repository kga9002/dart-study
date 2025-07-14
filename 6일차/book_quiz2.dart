import 'dart:convert';
import 'dart:io';

void main() {
  var firstNum, secondNum, againInput;
  bool doAgain = true;

  while (doAgain) {
    stdout.write("첫번째 수 입력 : ");
    firstNum = stdin.readLineSync();
    stdout.write("두번째 수 입력 : ");
    secondNum = stdin.readLineSync();
    stdout.writeln(
      "실행결과 : $firstNum X $secondNum = ${int.parse(firstNum!) * int.parse(secondNum!)}",
    );
    stdout.write("한 번 더 진행하시겠습니까? : ");
    againInput = stdin.readLineSync(encoding: utf8);
    if (againInput == "네")
      doAgain = true;
    else {
      doAgain = false;
      stdout.write("프로그램을 종료합니다.");
    }
  }
}
