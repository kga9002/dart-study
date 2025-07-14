import 'dart:io';

Future<String> readFileToString(String filename) async {
  var file = File(filename);

  String fileContent = await file.readAsString();
  return fileContent;
}

void main() async {
  var file = File('6일차/quiz/temp.txt');

  // 파일에 문자열 저장 (빈칸을 채우세요)
  var sink = file.openWrite();
  sink.write("Dart는 재미있어요......");
  await sink.close();

  // 저장한 내용을 다시 읽기 (빈칸을 채우세요)
  String content = await readFileToString("6일차/quiz/temp.txt");

  print(content);
}
