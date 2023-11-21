import 'dart:developer';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:storage_app/app/data/repository/user_repository.dart';
import 'package:storage_app/app/routes/app_pages.dart';

class GoogleSignInController extends GetxController {
  Future<void> onGoogleSignInClick() async {
    try {
      final google = await GoogleSignIn().signIn();
      GoogleSignIn().signOut();
      if (google != null) {
        await UserRepository.instance.signIn(
            email: google.email,
            id: google.id,
            photo: google.photoUrl ?? '',
            name: google.displayName ?? '');
        Get.offAllNamed(Routes.QRCODE);
      }
    } catch (e, stackTrace) {
      log(e.toString(), stackTrace: stackTrace);
      Get.snackbar("Oops!", e.toString());
      //Get.offAllNamed(Routes.HOME);
    }
  }
}
