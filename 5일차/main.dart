class NegativeDivisorException implements Exception {
  @override
  String toString() {
    return "Zero divisor is not allowed";
  }
}

void main() {
  int num1 = 1;
  int num2 = 0;
  int result = 0;

  int calc(int left, int right) {
    int result = 0;

    if (right == 0) {
      throw NegativeDivisorException();
    } else {
      result = left ~/ right;
    }

    return result;
  }

  try {
    result = calc(num1, num2);
  } on NegativeDivisorException {
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
