import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';

import '../models/person.dart';
import '../response_msgs/bad_req_res.dart';

Future<Response> getUsershandler(Request _) async {
  try {
    File jsonFile = File('bin/json_files/persons_info.json');
    final Person presonData =
        Person.fromJson(json: json.decode(await jsonFile.readAsString()));

    return Response.ok(
      json.encode(presonData.toMap()),
      headers: {'content-type': 'application/json'},
    );
  } catch (error) {
    print(error);

    return BadReqRes().errorResponse(msg: "something went wrong!");
  }
}
