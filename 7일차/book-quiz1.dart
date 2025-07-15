import 'dart:io';

Future main() async {
  var ip = InternetAddress.loopbackIPv4;
  var port = 3000;

  var server = await HttpServer.bind(ip, port);

  print("\$ server activated - ${server.address.address}:${server.port}");
  await for (HttpRequest request in server) {
    try {
      if (request.uri.path.contains("/dan")) {
        var varList = request.uri.path.split(",");
        var dan = int.parse(varList[1]);

        request.response.statusCode = HttpStatus.ok;
        for (var i = 1; i < 10; i++) {
          request.response.write("$dan * $i = ${i * dan}\n");
        }
        await request.response.close();
      }
    } catch (e) {
      print(e);
    }
  }
}
