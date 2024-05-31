import 'package:get/get.dart';
import 'package:jiran_app/app/data/providers/user_providers.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut(() => UserProvider());
  }
}
