void main() {
  int num1 = 1;
  int num2 = 0;
  int result = 0;

  try {
    result = num1 ~/ num2;
  } on UnsupportedError {
    print("num2의 값은 0입니다.");
    num2 = 1;
    print("num2의 값을 1로 바꾸고 재시도 합니다.");
    result = num1 ~/ num2;
  } catch (e) {
    print("알수없는 에러");
  } finally {
    print(result);
  }
}
