import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jiran_app/app/core/logger.dart';

class StorageProvider extends GetxService {
  GetStorage box = GetStorage();

  Future<void> setUserId(int? id) async => await box.write("id", id);
  String? getUserId() => box.read("id")?.toString();

  Future<void> setUserName(String name) async => await box.write("name", name);
  String? getUserName() => box.read("name");

  Future<void> setToken(String token) async => await box.write("token", token);
  String? getToken() => box.read("token") as String?;

  Future<void> setRole(String role) async => await box.write("role", role);
  String? getRole() => box.read("role") as String?;

  Future<void> setEmail(String email) async => await box.write("email", email);
  String? getEmail() => box.read("email");

  // isRequestDelete
  Future<void> setIsRequestDelete(bool isRequestDelete) async => await box.write("isRequestDelete", isRequestDelete);
  bool? getIsRequestDelete() => box.read("isRequestDelete");

  // Use storedUsername as needed
  void someFunction() {
    if (getUserName() != null) {
      appLogger('Stored Username: $getUserName');
    } else {
      appLogger('Username not found in storage.');
    }
  }

  Future<void> logout() async {
    await box.remove("id");
    await box.remove("name");
    await box.remove("email");
    await box.remove("token");
    await box.remove("role");
  }
}
