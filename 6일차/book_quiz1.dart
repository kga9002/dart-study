import 'dart:io';
import "dart:convert";

void main() {
  List<dynamic> userInput = [];
  void getInput() {
    stdout.write("안녕하세요. 출력하실 내용을 입력해주세요 : ");
    userInput.add(stdin.readLineSync(encoding: utf8));
  }

  getInput();

  while (userInput.length < 5) {
    stdout.writeln("입력한 내용 : $userInput");
    getInput();
  }
  stdout.writeln("입력한 내용 : $userInput");
  stdout.writeln("프로그램을 종료합니다.");
}
