import 'dart:convert';

import 'package:get/get.dart';
import 'package:storage_app/app/data/models/user.dart';
import 'package:storage_app/app/data/repository/user_repository.dart';
import 'package:storage_app/app/data/service/shared_preferences_service.dart';
import 'package:storage_app/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 2)).then((value) async {
      final result = SharedPreferencesService.instance.getString('user');
      if (result == null) {
        Get.offNamed(Routes.GOOGLE_SIGN_IN);
      } else {
        final user = User.fromMap(json.decode(result));
        await UserRepository.instance.signIn(
            id: user.id,
            email: user.email,
            name: user.name,
            photo: user.picture);
        Get.offAllNamed(Routes.HOME);
      }
    });
    super.onReady();
  }
}
