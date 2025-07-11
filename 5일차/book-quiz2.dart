void main() async {
  print("안녕하세요");
  await Future.delayed(Duration(seconds: 10), () => print("10초뒤에 실행된 코드입니다."));
  print("안녕하세요");

  String temp = await sayHello();
  print("$temp가 출력되었습니다.");
}

Future<String> sayHello() async {
  String hello = await Future.delayed(Duration(seconds: 5), () => "hello");
  print(hello);
  return hello;
}
