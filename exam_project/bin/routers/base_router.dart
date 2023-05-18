import 'package:shelf_router/shelf_router.dart';
import '../responses/create_user_res.dart';
import '../responses/delete_image_res.dart';
import '../responses/get_users_res.dart';
import '../responses/login_res.dart';
import '../responses/root_res.dart';
import '../responses/save_image_res.dart';
import '../responses/update_user.dart';

class BaseRouter {
  Router get handler {
    final router = Router()
      ..get('/', rootHandler)
      ..post('/login', loginHandler)
      ..post('/save_image/<filename>', saveImageHandler)
      ..delete('/delete_image/<fullFilename>', deleteImageHandler)
      ..post('/create_user', createUserhandler)
      ..get('/get_users', getUsershandler)
      ..put('/update_user', updateUserhandler);

    return router;
  }
}
