import 'package:shelf/shelf.dart';

import '../response_msgs/bad_req_res.dart';
import '../response_msgs/ok_res.dart';

Response rootHandler(Request _) {
  try {
    return OkRes().okResponse(msg: "server is working!");
  } catch (error) {
    print(error);

    return BadReqRes().errorResponse(msg: "something went wrong!");
  }
}
