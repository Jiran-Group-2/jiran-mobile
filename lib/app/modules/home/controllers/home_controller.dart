import 'package:get/get.dart';
import 'package:jiran_app/app/data/models/announcement_model.dart';
import 'package:jiran_app/app/data/models/bill_model.dart';
import 'package:jiran_app/app/data/providers/announcement_providers.dart';
import 'package:jiran_app/app/data/providers/bill_providers.dart';
import 'package:jiran_app/controller_export.dart';

class HomeController extends GetxController {

  AnnouncementProvider announcementProvider = Get.find<AnnouncementProvider>();
  RxList<AnnouncementModel> announcements = <AnnouncementModel>[].obs;

  BillProvider billProvider = Get.find<BillProvider>();
  RxList<BillModel> bills = <BillModel>[].obs;

  RxDouble billAmount = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    onRefresh();
  }

  onRefresh() async {
    getAnnouncements();
    getBills();
  }

  getBills() async {
    EasyLoading.show();
    var response = await billProvider.getBills();

    if (!verifyResponse(response)) {
      AppError appError = response;
      AppSnackbar.errorSnackbar(appError.message ?? 'An error occurred');
      EasyLoading.dismiss();
      return;
    }

    bills.value = response;

    // Calculate bill total amount by looping through the bills and put into a variable
    billAmount.value = 0.0;
    for (var bill in bills) {
      billAmount.value += bill.balance ?? 0;
    }

    appLogger(billAmount.value);

    EasyLoading.dismiss();
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
