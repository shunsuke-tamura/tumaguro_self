import 'dart:convert';

import 'package:dart_shelf_rest_api/fetch.dart';
import 'package:shelf/shelf.dart';

Future<Response> productListHandler(Request request) async {
  dynamic res = await hoge();
  return Response.ok(
    const JsonEncoder.withIndent('  ').convert(res),
    headers: {'content-type': 'application/json'},
  );
}
