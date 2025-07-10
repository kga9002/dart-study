abstract class Vehicle {
  void drive();
}

class Boat implements Vehicle {
  @override
  void drive() {
    print("보트가 물위를 떠다닙니다");
  }

  Boat() {}
}

class Car implements Vehicle {
  @override
  void drive() {
    print("자동차가 도로를 달립니다.");
  }

  Car() {}
}

void main() {
  var boat = Boat();
  var car = Car();

  boat.drive();
  car.drive();
}
