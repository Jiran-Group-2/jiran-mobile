import 'package:get/get.dart';
import 'package:jiran_app/app/data/models/announcement_model.dart';
import 'package:jiran_app/app/data/providers/announcement_providers.dart';
import 'package:jiran_app/controller_export.dart';

class HomeController extends GetxController {

  AnnouncementProvider announcementProvider = Get.find<AnnouncementProvider>();
  RxList<AnnouncementModel> announcements = <AnnouncementModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAnnouncements();
  }

  getAnnouncements() async {
    EasyLoading.show();
    var response = await announcementProvider.getAnnouncements();

    if (!verifyResponse(response)) {
      AppError appError = response;
      AppSnackbar.errorSnackbar(appError.message ?? 'An error occurred');
      EasyLoading.dismiss();
      return;
    }

    announcements.value = response;
    EasyLoading.dismiss();
  }
}
