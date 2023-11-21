import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:storage_app/app/data/service/shared_preferences_service.dart';
import 'package:storage_app/app/global/controllers/app_controller.dart';
import 'package:storage_app/app/routes/app_pages.dart';

class HomeProfile extends StatelessWidget {
  HomeProfile({Key? key}) : super(key: key);

  final moneyFormat = NumberFormat("#,##0", "id_ID");
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 45,
            backgroundImage:
                NetworkImage(Get.find<AppController>().user!.picture),
          ),
          const SizedBox(height: 30),
          Text(
            Get.find<AppController>().user!.name,
            maxLines: 3,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(
              "Saldo : IDR ${moneyFormat.format(Get.find<AppController>().user!.saldo)}"),
          const SizedBox(height: 30),
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.red),
              onPressed: () {
                Get.offAllNamed(Routes.GOOGLE_SIGN_IN);
                SharedPreferencesService.instance.remove('user');
              },
              child: const Text("Log out"))
        ],
      ),
    );
  }
}
