import "dart:convert";
import "dart:io";

void main() {
  var iList = <String>[];
  var indexLst = <int>[];

  stdout.write("숫자 두배를 ,를 통해 입력해주세요. (예시 3,3)");
  var input = stdin.readLineSync();

  iList = input!.split(",");

  for (var item in iList) {
    indexLst.add(int.parse(item));
  }

  stdout.writeln(
    "더하기 프로그램을 진행합니다. ${indexLst[0]} + ${indexLst[1]} = ${indexLst[0] + indexLst[1]}",
  );
}
