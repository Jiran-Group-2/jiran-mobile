import 'package:get/get.dart';
import 'package:jiran_app/app/data/providers/storage_provider.dart';
import 'package:jiran_app/app/data/providers/visitor_providers.dart';

import '../controllers/guard_home_controller.dart';

class GuardHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GuardHomeController>(
      () => GuardHomeController(),
    );
    Get.lazyPut(() => StorageProvider());
    Get.lazyPut(() => VisitorProvider());
  }
}
