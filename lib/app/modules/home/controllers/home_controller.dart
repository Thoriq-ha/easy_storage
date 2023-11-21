import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:storage_app/app/data/repository/user_repository.dart';
import 'package:storage_app/app/modules/home/views/home_snackbar.dart';

class HomeController extends GetxController
    with StateMixin<List<Map<String, dynamic>>> {
  final _day = "Good Morning".obs;
  String get day => _day.value;
  set day(String val) => _day.value = val;

  final LocalAuthentication auth = LocalAuthentication();

  @override
  void onInit() {
    final now = DateTime.now();
    if (now.hour < 5) {
      day = "Good Night";
    } else if (now.hour < 10) {
      day = "Good Morning";
    } else if (now.hour < 15) {
      day = "Good Afternoon";
    } else if (now.hour < 18) {
      day = "Good Evening";
    } else {
      day = "Good Night";
    }
    getListSlot();
    scrollController.addListener(() {
      if (scrollController.hasClients) {
        scrollPosition.value = scrollController.position.pixels;
      }
      hasScroll.value = scrollController.hasClients;
    });
    super.onInit();
  }

  final hasScroll = false.obs;
  RxDouble scrollPosition = 0.0.obs;

  Future<bool> authenticate(String reason) async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason: reason,
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );
    } on PlatformException {
      return false;
    }
    return authenticated;
  }

  Future<void> cancelAuthentication() async {
    await auth.stopAuthentication();
  }

  RxList<Map<String, dynamic>> data = <Map<String, dynamic>>[].obs;
  final scrollController = ScrollController(keepScrollOffset: false);

  Future<void> getListSlot() async {
    if (data.isEmpty) {
      change(data, status: RxStatus.loading());
    }
    try {
      UserRepository.instance.getListSlot().then((value) {
        data.clear();
        change(value, status: RxStatus.success());
        data.addAll(value);
      });
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  Future<void> setSlot(int index) async {
    Get.bottomSheet(PaymentSnackbar()).then((payment) {
      if (payment != null) {
        authenticate("you need to verify for assign to park ${index + 1}")
            .then((value) async {
          if (value) {
            final result = await UserRepository.instance
                .setId(index + 1, payment.toString());
            getListSlot();
            if (!result) {
              Get.snackbar("Oops!", "Slot already used");
            }
          }
        });
      }
    });
  }

  Future<void> deleteSlot(int index) async {
    authenticate("you need to verify for out from park ${index + 1}")
        .then((value) async {
      if (value) {
        final result = await UserRepository.instance.deleteSlot(index + 1);
        getListSlot();
        if (!result) {
          Get.snackbar("Oops!", "Slot already deleted");
        }
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
