class Box<T> {
  late dynamic item;

  static int changeCount = 0;
  int totalCount = 0;

  Box(T givenItem) : item = givenItem;

  dynamic get() {
    return item;
  }

  void set(dynamic newItem) {
    item = newItem;
    changeCount = changeCount + 1;
    totalCount = totalCount + 1;
  }
}

void main() {
  var intBox = Box(1);
  var newBox2 = Box("참치");

  print(intBox.get());

  intBox.set(2);
  newBox2.set(1);

  print(Box.changeCount);
  print(intBox.totalCount);
  print(Box.changeCount);
}
