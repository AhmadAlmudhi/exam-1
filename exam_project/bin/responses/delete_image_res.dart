import 'dart:io';

import 'package:shelf/shelf.dart';

import '../response_msgs/bad_req_res.dart';
import '../response_msgs/not_found_res.dart';
import '../response_msgs/ok_res.dart';

Future<Response> deleteImageHandler(Request _, String fullFilename) async {
  try {
    File file = File('bin/images/$fullFilename');

    if (await file.exists()) {
      file.deleteSync();
    } else {
      return NotFoundRes().errorResponse(msg: "image not found!");
    }

    return OkRes().okResponse(msg: "image has been deleted!");
  } catch (error) {
    print(error);

    return BadReqRes().errorResponse(msg: "something went wrong!");
  }
}
