// files 폴더 내에 다음의 Map 변수의 key 가 파일명이 되고,
// value 가 각 파일의 내용이 되도록 하는 코드를 구현하세요.
// 각 폴더들은 ./6일차/quiz 폴더에 저장되어야 합니다.
// 각 파일의 확장자는 .txt 입니다.

import 'dart:io';

void main() {
  var files = {
    "file1": "file1 파일 내용입니다.",
    "file2": "file2 파일 내용입니다.",
    "file3": "file3 파일 내용입니다.",
  };

  files.forEach((key, value) async {
    var sink = File("6일차/quiz/files/$key.txt").openWrite();
    sink.write(value);
    await sink.close();
  });
}
