import 'package:get/get.dart';

import '../modules/google_sign_in/bindings/google_sign_in_binding.dart';
import '../modules/google_sign_in/views/google_sign_in_view.dart';
import '../modules/history/bindings/history_binding.dart';
import '../modules/history/views/history_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/instruction/bindings/instruction_binding.dart';
import '../modules/instruction/views/instruction_view.dart';
import '../modules/qrcode/bindings/qrcode_binding.dart';
import '../modules/qrcode/views/qrcode_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.GOOGLE_SIGN_IN,
      page: () => const GoogleSignInView(),
      binding: GoogleSignInBinding(),
    ),
    GetPage(
      name: _Paths.INSTRUCTION,
      page: () => const InstructionView(),
      binding: InstructionBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => const HistoryView(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: _Paths.QRCODE,
      page: () => const QrcodeView(),
      binding: QrcodeBinding(),
    ),
  ];
}
