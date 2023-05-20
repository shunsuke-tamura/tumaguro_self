import 'dart:convert';

import 'package:dart_shelf_rest_api/fetch.dart';
import 'package:dart_shelf_rest_api/models/product.dart';
import 'package:shelf/shelf.dart';

Future<Response> productListHandler(Request request) async {
  Map<String, dynamic> res = await fetchProducts();
  List<dynamic> data = res['data'];
  return Response.ok(
    JsonEncoder.withIndent('  ').convert(
      {
        'products': data
            .map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList(),
      },
    ),
    headers: {'content-type': 'application/json'},
  );
}
