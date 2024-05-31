import 'package:get/get.dart';
import 'package:jiran_app/app/data/models/complaint_model.dart';
import 'package:jiran_app/app/data/providers/complaint_providers.dart';
import 'package:jiran_app/controller_export.dart';

class ComplaintController extends GetxController {

  ComplaintProvider complaintProvider = Get.find<ComplaintProvider>();
  RxList<ComplaintModel> complaints = RxList<ComplaintModel>();
  
  @override
  void onInit() {
    super.onInit();
    getComplaints();
  }

  getComplaints() async {
    EasyLoading.show();
    var response = await complaintProvider.getComplaints(1, 2);

    if (!verifyResponse(response)) {
      AppError appError = response;
      AppSnackbar.errorSnackbar(appError.message ?? 'An error occurred');
      EasyLoading.dismiss();
      return;
    }

    complaints.value = response;
    EasyLoading.dismiss();
  }
}
