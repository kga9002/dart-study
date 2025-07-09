void main() {
  for (var i = 1; i <= 40; i++) {
    if (i.toString().contains("3"))
      print("짝");
    else
      print(i);
  }

  var j = 1;
  while (j <= 40) {
    if (j.toString().contains("3"))
      print("짝");
    else
      print(j);
    j++;
  }
}
