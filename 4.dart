void main() {
  num adult = 5000;
  num child = 3000;

  num adult_total_price, child_total_price, total_price, pay_price, change;

  adult_total_price = (adult * 2);
  child_total_price = child * 1;
  total_price = adult_total_price + child_total_price;
  pay_price = 15000;
  change = pay_price - total_price;

  final String receipt =
      '''
    비엔날레 입장권 영수증\n\n
    성인 (2 명) : $adult_total_price원\n
    아동 (1 명) : $child_total_price원\n\n
    총 결제 금액 : $total_price원\n
    낸 금액 : $pay_price원\n
    거스름돈 : $change원
''';
  print(receipt);
}
