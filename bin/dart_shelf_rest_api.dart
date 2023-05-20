import 'dart:convert';

import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

Response _healthcheckHandler(request) {
  return Response.ok(
    const JsonEncoder.withIndent('  ').convert({'greeting': 'OK'}),
    headers: {'content-type': 'application/json'},
  );
}

class Service {
  Handler get handler {
    final router = Router();

    router.get('/healthcheck', _healthcheckHandler);

    return router;
  }
}

void main() async {
  final service = Service();
  final server = await shelf_io.serve(service.handler, 'localhost', 8081);
  print('Server running on localhost:${server.port}');
}
