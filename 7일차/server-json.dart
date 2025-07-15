import "dart:io";
import 'dart:convert';

void printHttpServerActivated(HttpServer server) {
  var ip = server.address.address;
  var port = server.port;

  print("\$ Server Activated in $ip:$port");
}

void printHttpRequestInfo(HttpRequest request) async {
  var ip = request.connectionInfo!.remoteAddress.address;
  var port = request.connectionInfo!.remotePort;
  var method = request.method;
  var path = request.uri.path;

  print("\$ $method $path from $ip:$port");

  if (request.headers.contentLength != -1) {
    print("\> content-type : ${request.headers.contentType}");
    print("\> content-length : ${request.headers.contentLength}");
  }
}

Future main() async {
  var server = await HttpServer.bind(InternetAddress.loopbackIPv4, 3000);

  printHttpServerActivated(server);
  await for (HttpRequest request in server) {
    printHttpRequestInfo(request);

    try {
      var content = await utf8.decoder.bind(request).join();
      var jsonData = jsonDecode(content) as Map;

      print("> content : $jsonData");
      print("> jsonData Korea : ${jsonData['Korea']}");

      content = "POST JSON accepted";
      request.response
        ..headers.contentType = ContentType("text", "plain", charset: "utf-8")
        ..headers.contentLength = content.length
        ..statusCode = HttpStatus.ok
        ..write(content);

      await request.response.close();
    } catch (e) {
      print(e);
      ;
    }
  }
}
