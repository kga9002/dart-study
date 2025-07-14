import 'dart:convert';
import 'dart:io';

void main() {
  var dayInput, doAgainInput;
  bool doAgain = true;

  var foods = {
    "7/14": "어묵국, 흰쌀밥, 포기김치",
    "7/15": "된장국, 잡곡밥, 어묵볶음, 비엔나 소세지, 깍두기", //와 잔반없는날~
    "7/16": "휴무일",
  };

  while (doAgain) {
    stdout.write("날짜를 입력하세요 : ");
    dayInput = stdin.readLineSync()!.trim();
    if (foods.containsKey(dayInput) && foods[dayInput] != "휴무일") {
      stdout.writeln("$dayInput 의 식단표 : ${foods[dayInput]}");
    } else if (foods.containsKey(dayInput) && foods[dayInput] == "휴무일") {
      stdout.writeln("급식을 진행하지 않는 날입니다.");
    } else {
      stdout.writeln("급식이 존재하지 않는 날입니다.");
    }
    stdout.write("이어서 출력할까요? : ");
    doAgainInput = stdin.readLineSync(encoding: utf8);
    if (doAgainInput == "네")
      doAgain = true;
    else {
      doAgain = false;
      stdout.writeln("프로그램을 종료합니다.");
    }
  }
}
