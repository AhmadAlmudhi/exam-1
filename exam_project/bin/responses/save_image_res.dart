import 'dart:io';
import 'package:shelf/shelf.dart';
// ignore: depend_on_referenced_packages
import 'package:http_parser/http_parser.dart';
import '../response_msgs/bad_req_res.dart';
import '../response_msgs/ok_res.dart';

Future<Response> saveImageHandler(Request req, String filename) async {
  try {
    final contentType = MediaType.parse(req.headers["Content-Type"]!);

    if (contentType.mimeType != "image/png" &&
        contentType.mimeType != "image/jpeg") {
      return BadReqRes().errorResponse(msg: "Invalid file format!");
    }

    final body = await req.read().expand((bit) => bit).toList();
    File jsonFile = File('bin/images/$filename.${contentType.subtype}');

    await jsonFile.writeAsBytes(body);

    return OkRes().okResponse(msg: "image has been saved!");
  } catch (error) {
    print(error);

    return BadReqRes().errorResponse(msg: "something went wrong!");
  }
}
