import 'dart:convert';

import 'package:dotenv/dotenv.dart';
import 'package:http/http.dart' as http;

Future<dynamic> hoge() async {
  var env = DotEnv(includePlatformEnvironment: true)..load();

  final url = Uri.parse('https://api.stripe.com/v1/products');
  final username = env['API_SK'];
  final password = '';

  final credentials = utf8.encode('$username:$password');
  final base64Credentials = base64.encode(credentials);
  final headers = {'Authorization': 'Basic $base64Credentials'};

  final httpPackageInfo = await http.get(url, headers: headers);
  return json.decode(httpPackageInfo.body);
}
