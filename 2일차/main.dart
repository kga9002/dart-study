void main() {
  var text = "";
  for (var i = 0; i < 7; i++) {
    String singleLine = "";
    for (var j = 0; j < 7; j++) {
      if (i == 0 || i == 6)
        singleLine += "-";
      else if (j == 0 || j == 6)
        singleLine += "|";
      else if (i == j || i + j == 6)
        singleLine += "X";
      else
        singleLine += "O";
    }
    text += "$singleLine\n";
  }
  print(text);

  for (var number = 2; number < 10; number += 2) {
    for (var number2 = 1; number2 < 10; number2++) {
      print("$number X $number2 = ${number * number2}");
    }
  }
}
