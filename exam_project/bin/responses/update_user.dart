import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';

import '../models/person.dart';
import '../response_msgs/bad_req_res.dart';
import '../response_msgs/ok_res.dart';

Future<Response> updateUserhandler(Request req) async {
  try {
    final Map body = json.decode(await req.readAsString());

    File jsonFile = File('bin/json_files/persons_info.json');
    final Person presonData =
        Person.fromJson(json: json.decode(await jsonFile.readAsString()));

    if (body.containsKey("name")) {
      presonData.name = body["name"];
    }
    if (body.containsKey("age")) {
      presonData.age = body["age"];
    }
    if (body.containsKey("address")) {
      presonData.address = body["address"];
    }

    await jsonFile.writeAsString(json.encode(presonData.toMap()));

    return OkRes().okResponse(msg: "update user is working!");
  } catch (error) {
    print(error);

    return BadReqRes().errorResponse(msg: "something went wrong!");
  }
}
