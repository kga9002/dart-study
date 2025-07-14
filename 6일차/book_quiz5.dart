import 'dart:convert';
import 'dart:io';

Future<List<String>> readFileToList(String filename) async {
  Stream<String> lines = File(
    filename,
  ).openRead().transform(utf8.decoder).transform(LineSplitter());

  try {
    List<String> sList = [];
    await for (var line in lines) {
      sList.add(line);
    }
    return sList;
  } catch (e) {
    throw (e);
  }
}

void main() async {
  List<String> fileContent = await readFileToList("6일차/quiz6.txt");
  var sList = [];
  var iVar1 = 0;
  var iVar2 = 0;

  var dstSink = File("6일차/quiz5-answer.txt").openWrite();

  for (var fileLine in fileContent) {
    sList = fileLine.split(",");
    iVar1 = int.parse(sList[0]);
    iVar2 = int.parse(sList[1]);
    dstSink.write("$iVar1 + $iVar2 = ${iVar1 + iVar2}\n");
  }

  dstSink.close();
}
