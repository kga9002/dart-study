// quiz2.dart 파일을 참고하여 다음의 기능들을 추가로 구현하세요.
// 1. GET 메서드를 사용해 모든 나라의 수도를 출력하는 기능을 구현하세요.
// 경로는 /all 이며,
// 반환되는 데이터는 JSON 형식이어야 합니다.
// 2. DELETE 메서드를 사용해 입력한 나라를 삭제하는 기능을 구현하세요.
// 경로는 /delete=나라이름 이며,
// 해당 데이터를 삭제한 후 남아있는 나라들을 반환해야 합니다.
// 반환되는 데이터는 JSON 형식이여야 합니다.
import 'dart:convert';
import 'dart:io';

Map capital = {
  "Korea": "Seoul",
  "Japan": "Tokyo",
  "China": "Beijing",
  "Canada": "Ottawa",
  "Australia": "Canberra",
};

Future main() async {
  var ip = InternetAddress.loopbackIPv4;
  var port = 3000;

  var server = await HttpServer.bind(ip, port);

  print("\$ server activated - ${server.address.address}:${server.port}");

  await for (HttpRequest request in server) {
    var path = request.uri.path;
    var method = request.method;
    if (method == "GET" && path == "/all") {
      var content = jsonEncode(capital);
      request.response
        ..statusCode = HttpStatus.ok
        ..headers.contentType = ContentType.json
        ..write(content);
    } else if (method == "DELETE" && path.startsWith("/delete")) {
      var countryName = path.split("=")[1];
      if (capital.containsKey(countryName)) {
        capital.remove(countryName);
        request.response
          ..statusCode = HttpStatus.ok
          ..headers.contentType = ContentType.json
          ..write(jsonEncode(capital));
      } else {
        request.response
          ..statusCode = HttpStatus.notFound
          ..headers.contentType = ContentType.json
          ..write("해당 나라가 없습니다.");
      }
    }
    await request.response.close();
  }
}
