import 'dart:math';

void main() {
  List list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  list.insert(0, 9);
  print(list);

  //==================================================

  print(list[6]);

  //==================================================
  List newList = ["1", "2", "3"];
  list.addAll(newList);
  print(list);

  //==================================================
  List stringList = ["Apple", "Mango", "Banana", "Kiwi", "Grape"];
  stringList.sort();
  print(stringList);

  //==================================================
  List numberList = [];
  for (int i = 0; i < 10; i++) {
    numberList.add(Random().nextInt(100));
  }
  print(numberList);
}
