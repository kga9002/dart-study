// 컴퓨터는 가위바위보중에 랜덤
// 사용자는 셋중에 하나 입력
// 결과를 프린트
// 세번 먼저 이긴사람이 승리-종료
// 한판 끝난뒤에는 현황 점수 확인 컴1:나1

import 'dart:convert';
import 'dart:io';
import 'dart:math';

void main() {
  var RSP = ["가위", "바위", "보"];
  var userInput, comInput;
  Map<String, int> result = {"user": 0, "computer": 0};

  String getResult(String user, String computer) {
    if (user == computer) return '무승부';

    if ((user == '가위' && computer == '보') ||
        (user == '바위' && computer == '가위') ||
        (user == '보' && computer == '바위')) {
      result["user"] = (result["user"] ?? 0) + 1;
      return '승리!';
    } else {
      result["computer"] = (result["computer"] ?? 0) + 1;
      return '패배';
    }
  }

  while (!result.containsValue(3)) {
    stdout.write("가위,바위,보 중에서 입력 : ");
    userInput = stdin.readLineSync(encoding: utf8);
    comInput = RSP[Random().nextInt(3)];

    stdout.writeln("컴퓨터는 $comInput을 냈습니다.");
    stdout.writeln(getResult(userInput, comInput));
    stdout.writeln("현황 - 컴퓨터 ${result["computer"]} : ${result["user"]} 사용자");
  }

  stdout.writeln("승자 : ${result["user"] == 3 ? "사용자" : "컴퓨터"}\n프로그램을 종료합니다.");
}
