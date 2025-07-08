import 'dart:math';

void main() {
  var random1 = Random().nextInt(100);
  var random2 = Random().nextInt(100);

  print("[$random1, $random2]");
  print("gcd is ${random1.gcd(random2)}");
  print("lcm is ${(random1 * random2) / (random1.gcd(random2))}");
}
