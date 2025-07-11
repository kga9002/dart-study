class Shop<T> {
  late T item;

  Shop(T givenItem) : item = givenItem;

  void changeItem(dynamic newItem) {
    item = newItem;
  }

  dynamic getSellingItem() {
    return item;
  }
}

void main() {
  var shop = Shop("아디다스");

  shop.changeItem("청바지");

  print(shop.getSellingItem()); //청바지
  shop.changeItem(100.1);
  print(shop.getSellingItem()); //100.1
}
