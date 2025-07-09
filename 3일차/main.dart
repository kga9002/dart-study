void main() {
  Set<String> korean1 = {"가", "나", "다", "라", "마", "바", "사"};
  Set<String> korean2 = {"라", "마", "바", "사", "아", "자", "차", "카", "파", "타", "하"};
  Set newKorean = {};
  newKorean.addAll(korean1);
  newKorean.addAll(korean2);

  print(newKorean);
  //교집합,,합집합,,,차집합을 새로운 세트로
  Set intersection = korean1.intersection(korean2);
  print(intersection);

  Set difference = korean1.difference(korean2);
  print(difference);

  Set union = korean1.union(korean2);
  print(union);

  //==============================================

  Map shop = {"apple": 10, "banana": 5, "mango": 3};
  var mangoCnt = shop.containsKey("mango") ? shop["mango"] : 0;
  print("이 상점에서는 망고를 $mangoCnt개 판매하고 있습니다.");

  shop['mango'] -= 2;
  print("현재 망고 갯수 : ${shop["mango"]}");
}
