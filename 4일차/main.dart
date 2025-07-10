abstract class Rectangle {
  int cx = 0, cy = 0;

  // 선언만 할수있고 내부에서 뭔가 할수 없다.
  void draw();
}

class Square implements Rectangle {
  @override
  int cx = 0, cy = 0;

  late int width, height;

  @override
  void draw() {
    print("사각형을 그립니다.");
  }

  Square([int givenWidth = 5, givenHeight = 7])
    : width = givenWidth,
      height = givenHeight;
}

class Circle implements Rectangle {
  @override
  int cx = 0, cy = 0;

  late int radius;

  @override
  void draw() {
    print("원을 그립니다.");
  }

  Circle([int givenRadius = 1]) : radius = givenRadius;
}

void main() {
  var circle = Circle();
  var square = Square(10, 24);

  circle.draw();
}
