void main() {
  List<int> numArr = [];
  for (int i = 1; i <= 100; i++) {
    if (i.isEven)
      numArr.add(i);
    else
      continue;
  }
}
