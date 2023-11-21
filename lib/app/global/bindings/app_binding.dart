import 'package:get/get.dart';
import 'package:storage_app/app/global/controllers/app_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AppController());
  }
}
