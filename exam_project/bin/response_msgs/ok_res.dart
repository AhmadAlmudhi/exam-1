import 'dart:convert';

import 'package:shelf/shelf.dart';

class OkRes {
  okResponse({required String msg}) {
    return Response.ok(
      json.encode({"msg": msg, 'status code': 200}),
      headers: {'content-type': 'application/json'},
    );
  }
}
