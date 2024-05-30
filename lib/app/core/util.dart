import 'package:jiran_app/app/data/models/app_model.dart';

bool verifyResponse(dynamic data) {
  if (data.runtimeType == AppError) {
    return false;
  } else {
    return true;
  }
}
