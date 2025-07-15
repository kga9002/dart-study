// localhost:8080 으로 접근할 수 있는 서버를 생성하고,
// 크롬 검색창에서 localhost:8080/capital=Korea 과 같이 입력했을 때,
// 다음과 같이 출력이 되는 기능을 만드세요.
// [Korea의 수도는 Seoul 입니다.]
// 단, 수도가 입력되지 않은 경우는 다음과 같이 출력되어야 합니다.
// [유효하지 않은 수도를 입력하셨습니다.]
import "dart:io";

void printHttpServerActivated(HttpServer server) {
  var ip = server.address.address;
  var port = server.port;

  print("\$ Server Activated in $ip:$port");
}

Future main() async {
  Map capital = {
    "Korea": "Seoul",
    "Japan": "Tokyo",
    "China": "Beijing",
    "Canada": "Ottawa",
    "Australia": "Canberra",
  };

  var server = await HttpServer.bind(InternetAddress.loopbackIPv4, 8080);

  printHttpServerActivated(server);

  await for (HttpRequest request in server) {
    try {
      if (request.uri.path.contains("capital")) {
        var capitalKey = request.uri.path.split("=")[1];

        request.response.statusCode = HttpStatus.ok;
        if (capital[capitalKey] == null) {
          request.response.write("유효하지 않은 수도를 입력하셨습니다.");
        } else {
          request.response.write("$capitalKey의 수도는 ${capital[capitalKey]}");
        }
        await request.response.close();
      }
    } catch (e) {
      print(e);
    }
  }
}
