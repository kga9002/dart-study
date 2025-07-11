class Box<T> {
  late int item;

  Box(int givenItem) : item = givenItem;

  int get() {
    return item;
  }

  void set(int newItem) {
    item = newItem;
  }
}

void main() {
  var intBox = Box(1);

  print(intBox.get());
}
