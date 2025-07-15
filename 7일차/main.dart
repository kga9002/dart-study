import "dart:io";

void main() async {
  var ip = InternetAddress.loopbackIPv4;
  var port = 4040;
  var server = await HttpServer.bind(ip, port);

  print("\$ server activated - ${server.address.address}:${server.port}");

  await for (HttpRequest request in server) {
    try {
      if (request.uri.path == "/") {
        print("http response is 'Hello world'");
        print("send '200 ok'");

        request.response
          ..statusCode = HttpStatus.ok
          ..write("Hello World");

        await request.response.close();
      } else if (request.uri.path.contains("/add")) {
        print("http response is result of 'add' operation");
        print("send '200 ok'");

        var varList = request.uri.path.split(",");
        var result = int.parse(varList[1]) + int.parse(varList[2]);

        request.response
          ..statusCode = HttpStatus.ok
          ..write("${varList[1]} + ${varList[2]} = $result");
        await request.response.close();
      } else if (await File(request.uri.path.substring(1)).exists() == true) {
        print("https response is ${request.uri.path} file transfer");
        print("send '200 ok'");

        var file = File(request.uri.path.substring(1));
        var fileContent = await file.readAsString();

        request.response
          ..statusCode = HttpStatus.ok
          ..headers.contentType = ContentType('text', "plain", charset: "utf-8")
          ..write(fileContent);

        await request.response.close();
      } else if (request.uri.path.contains("/dan")) {
        var varList = request.uri.path.split(",");
        var dan = int.parse(varList[1]);

        request.response.statusCode = HttpStatus.ok;
        for (var i = 1; i < 10; i++) {
          request.response.write("$dan * $i = ${i * dan}\n");
        }
        await request.response.close();
      }
    } catch (e) {
      print("exception in http request processing");
      print(e);
    }
  }
}
