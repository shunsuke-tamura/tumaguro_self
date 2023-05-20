import 'dart:convert';
import 'dart:io';

import 'package:dart_shelf_rest_api/product_list.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf/shelf.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';
import 'package:shelf_router/shelf_router.dart';

Response _healthcheckHandler(request) {
  return Response.ok(
    const JsonEncoder.withIndent('  ').convert({'greeting': 'OKK'}),
    headers: {'content-type': 'application/json'},
  );
}

class Service {
  Handler get handler {
    final router = Router();

    router.get('/healthcheck', _healthcheckHandler);
    router.get('/product_list', productListHandler);

    return router;
  }
}

Future<HttpServer> createServer() async {
  final service = Service();
  final server = await shelf_io.serve(service.handler, 'localhost', 8081);
  print('Server running on localhost:${server.port}');
  return server;
}

// Run this app with --enable-vm-service (or use debug run)
// dart run --enable-vm-service bin/dart_shelf_rest_api.dart
void main() async {
  withHotreload(() => createServer());
}
