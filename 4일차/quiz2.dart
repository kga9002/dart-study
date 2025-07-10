class Human {
  late String _name;
  late int _age;
  late String _gender;

  Human({required givenName, required givenAge, required givenGen}) {
    _name = givenName;
    _age = givenAge;
    _gender = givenGen;
  }

  void getProfile() {
    print("안녕하세요. 제 이름은 $_name이며, $_age살 $_gender입니다.");
  }
}

void main() {
  var cheolsoo = Human(givenName: "김철수", givenAge: 16, givenGen: "남성");
  cheolsoo.getProfile();
}
