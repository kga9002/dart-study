import 'dart:convert';
import 'dart:io';

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
}

void printAndSendHttpResponse(var db, var request, var content) async {
  print("\$ $content \n current DB     : $db");
  request.response
    ..headers.contentType = ContentType("text", "plain", charset: "utf-8")
    ..headers.contentLength = content.length
    ..statusCode = HttpStatus.ok
    ..write(content);

  await request.response.close();
}

void createDB(var db, var request) async {
  var content = await utf8.decoder.bind(request).join();
  var transaction = jsonDecode(content) as Map;
  var key, value;
  print("\> content : $content");

  transaction.forEach((k, v) {
    key = k;
    value = v;
  });
  ;

  if (db.containsKey(key) == false) {
    db[key] = value;
    content = "Success < $transaction created>";
  } else {
    content = "Fail < $key already exist";
  }
  printAndSendHttpResponse(db, request, content);
}

void readDB(var db, HttpRequest request) async {
  var key = request.uri.pathSegments.last;
  var content, transaction;

  if (db.containsKey(key) == true) {
    transaction = {};
    transaction[key] = db[key];
    content = "Success < $transaction retrieved";
  } else {
    content = "Fail < $key not-exist >";
  }
  printAndSendHttpResponse(db, request, content);
}

void updateDB(var db, var request) async {
  var content = await utf8.decoder.bind(request).join();
  var transaction = jsonDecode(content) as Map;

  var key, value;
  print("\> content : $content");

  transaction.forEach((k, v) {
    key = k;
    value = v;
  });

  if (db.containsKey(key)) {
    db[key] = value;
    content = "Success < $transaction updated >";
  } else {
    content = "Fail < $key already exist >";
  }
  printAndSendHttpResponse(db, request, content);
}

void delete(var db, var request) async {
  var key = request.uri.pathSegments.last;
  var content, value;

  if (db.containsKey(key)) {
    value = db[key];
    db.remove(key);

    content = "Success < $value delete >";
  } else {
    content = "Fail < $key not-exist >";
  }
  printAndSendHttpResponse(db, request, content);
}

Future main() async {
  var db = <dynamic, dynamic>{};
  var server = await HttpServer.bind(InternetAddress.loopbackIPv4, 4040);

  printHttpServerActivated(server);

  await for (HttpRequest request in server) {
    if (request.uri.path.contains("/api") == true) {
      printHttpRequestInfo(request);

      try {
        switch (request.method) {
          case "POST":
            createDB(db, request);
            break;
          case "GET":
            readDB(db, request);
            break;
          case "PUT":
            updateDB(db, request);
            break;
          case "DELETE":
            delete(db, request);
            break;
          default:
            print("Unsupported http method");
        }
      } catch (e) {
        print(e);
      }
    } else {
      printAndSendHttpResponse(
        db,
        request,
        "${request.method} {Error:unsupported API}",
      );
    }
  }
}
