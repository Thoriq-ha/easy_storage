import 'package:get/get.dart';

import '../controllers/google_sign_in_controller.dart';

class GoogleSignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GoogleSignInController>(
      () => GoogleSignInController(),
    );
  }
}
