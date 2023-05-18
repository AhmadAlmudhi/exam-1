import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';
import '../response_msgs/bad_req_res.dart';
import '../response_msgs/not_found_res.dart';
import '../response_msgs/ok_res.dart';

Future<Response> loginHandler(Request req) async {
  try {
    File jsonFile = File('bin/json_files/login_info.json');
    final Map body = json.decode(await req.readAsString());
    final correctData = json.decode(await jsonFile.readAsString());
    if (body.keys.toString() != "(email, password)") {
      return BadReqRes().errorResponse(msg: "Invalid input!");
    }

    if (body["email"] == correctData["email"] &&
        body["password"] == correctData["password"]) {
      return OkRes().okResponse(msg: "Authentication was successful!");
    }

    return NotFoundRes().errorResponse(msg: "User not found!");
  } catch (error) {
    print(error);

    return BadReqRes().errorResponse(msg: "Something went wrong!");
  }
}
