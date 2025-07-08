void main() {
  int score = 70;
  String getGrade(var number) {
    if (number > 90)
      return "A";
    else if (number > 80)
      return "B";
    else if (number > 70)
      return "C";
    else if (number > 60)
      return "D";
    else if (number > 50)
      return "E";
    else
      return "F";
  }

  print("[철수의 시험 점수는 $score점 이며, 등급은 ${getGrade(score)}입니다.]");
}
