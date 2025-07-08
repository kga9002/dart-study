String getPerson({
  required String name,
  required String phone,
  dynamic age = "비공개",
}) {
  return "[제 이름은 $name, 전화번호는 $phone이며, 제 나이는 $age입니다.]";
}

void main() {
  var text = getPerson(name: "김지애", phone: "010-9699-9002");
  print(text);
}
