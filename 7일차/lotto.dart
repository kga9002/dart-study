import 'dart:math';
import 'dart:collection';

void main() {
  Set<int> numList = {};
  var name = "";
  while (numList.length < 6) {
    numList.add(Random().nextInt(44) + 1);
  }
  final sortedList = SplayTreeSet<int>.from(numList, (a, b) => a - b);
  print("$name의 로또번호는... $sortedList");
}
