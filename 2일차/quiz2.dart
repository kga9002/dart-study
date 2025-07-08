void main() {
  var height = 1.76;
  var weight = 63;
  var bmi = weight / (height * height);

  String getBmi(double bmi) {
    if (bmi <= 18.4)
      return "저체중";
    else if (bmi <= 22.9)
      return "정상";
    else if (bmi <= 24.9)
      return "과체중";
    else
      return "비만";
  }

  print(
    "[영재의 BMI 점수는 ${bmi.toStringAsFixed((2))}점 이며, 등급은 ${getBmi(bmi)}입니다.]",
  );
}
