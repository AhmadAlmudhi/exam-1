import 'dart:convert';

import 'package:shelf/shelf.dart';

class NotFoundRes {
  errorResponse({required String msg}) {
    return Response.notFound(
      json.encode({"msg": msg, 'status code': 404}),
      headers: {'Content-Type': 'application/json'},
    );
  }
}
