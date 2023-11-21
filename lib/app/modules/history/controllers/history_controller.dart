import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:storage_app/app/data/repository/user_repository.dart';

import '../../../data/models/history.dart';

class HistoryController extends GetxController with StateMixin<List<History>> {
  final moneyFormat = NumberFormat("#,##0", "id_ID");
  final dateFormate = DateFormat("dd/MM/yyyy");

  @override
  void onInit() {
    change(null, status: RxStatus.loading());
    UserRepository.instance.getHistory().then((value) {
      if (value.isEmpty) {
        change([], status: RxStatus.empty());
      } else {
        change(value, status: RxStatus.success());
      }
    });
    super.onInit();
  }
}
