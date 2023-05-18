import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';

import '../models/person.dart';
import '../response_msgs/bad_req_res.dart';
import '../response_msgs/ok_res.dart';

Future<Response> createUserhandler(Request req) async {
  try {
    File jsonFile = File('bin/json_files/persons_info.json');
    String jsonString = await jsonFile.readAsString();
    Map fileData = {};
    if (jsonString != "") {
      fileData = json.decode(jsonString);
    }

    final Map body = json.decode(await req.readAsString());

    if (body.keys.toString() != "(name, age, address)") {
      return BadReqRes().errorResponse(msg: "Invalid input!");
    }

    Person myPerson = Person.fromJson(json: body);

    if (myPerson.toMap() == fileData) {
      return BadReqRes().errorResponse(msg: "User already exists!");
    } else {
      await jsonFile.writeAsString(json.encode(myPerson.toMap()));

      return OkRes().okResponse(msg: "User has been created!");
    }
  } catch (error) {
    print(error);

    return BadReqRes().errorResponse(msg: "something went wrong!");
  }
}
