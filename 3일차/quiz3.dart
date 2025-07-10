class Player {
  // name, age
  late String _name;
  late int _age;

  // 생성자
  Player([String givenName = "", int givenAge = 0]) {
    _name = givenName;
    _age = givenAge;
  }

  // 사용자 이름 반환 getter
  String get getName => _name;

  // 사용자 나이 반환 getter
  int get getAge => _age;

  // 이름과 나이를 변경하는 setter
  set setName(String givenName) => _name = givenName;
  set setAge(int givenAge) => _age = givenAge;
}

void main() {}
