// 상점을 뜻하는 Shop 제네릭 클래스를 구현하고,
// 비어있는 부분을 작성해 코드를 완성하세요.

class Shop<T, P> {
  late T item;
  late P item2;

  Shop(T givenItem, P givenItem2) : item = givenItem, item2 = givenItem2;

  String get() {
    return "$item, $item2";
  }
}

void main() {
  var stringShop = Shop("나시", 1.1); // 문자열만 다룰 수 있어야 함.
  var doubleShop = Shop(1.1, "나시"); // 실수만 다룰 수 있어야 함.

  print(stringShop.get()); // [나시] 를 출력해야 함.
  print(doubleShop.get()); // [1.1] 을 출력해야 함.
}
