import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:storage_app/app/global/controllers/app_controller.dart';

class PaymentSnackbar extends GetView<AppController> {
  PaymentSnackbar({Key? key}) : super(key: key);

  final moneyFormat = NumberFormat("#,##0", "id_ID");

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 520.h,
      width: double.infinity,
      padding: EdgeInsets.all(39.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.r), topRight: Radius.circular(25.r))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Select Payment Method",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 32.h,
          ),
          ListTile(
            onTap: () {
              Get.back(result: 'ovo');
              Get.snackbar("Success!", "Ovo payment success!");
            },
            leading: SizedBox(
                height: 13.h,
                width: 75.w,
                child: Image.asset(
                  'assets/ovo.png',
                  fit: BoxFit.contain,
                )),
            title: Text(
              "Ovo",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
            ),
            trailing: Icon(
              Icons.navigate_next,
              color: Colors.black,
              size: 32.sp,
            ),
          ),
          ListTile(
            onTap: () {
              Get.back(result: 'gopay');
              Get.snackbar("Success!", "Gopay payment success!");
            },
            leading: SizedBox(
                height: 24.h,
                width: 75.w,
                child: Image.asset(
                  'assets/gopay.png',
                  fit: BoxFit.contain,
                )),
            title: Text(
              "Gopay",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
            ),
            trailing: Icon(
              Icons.navigate_next,
              color: Colors.black,
              size: 32.sp,
            ),
          ),
          ListTile(
            onTap: () {
              Get.back(result: 'dana');
              Get.snackbar("Success!", "Dana payment success!");
            },
            leading: SizedBox(
                height: 32.h,
                width: 75.w,
                child: Image.asset(
                  'assets/dana.png',
                  fit: BoxFit.contain,
                )),
            title: Text(
              "Dana",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
            ),
            trailing: Icon(
              Icons.navigate_next,
              color: Colors.black,
              size: 32.sp,
            ),
          ),
          ListTile(
            onTap: () {
              Get.back(result: 'transfer');
              Get.snackbar("Success!", "Bank Transfer payment success!");
            },
            leading: SizedBox(
                height: 24.h,
                width: 75.w,
                child: Image.asset(
                  'assets/transfer.png',
                  fit: BoxFit.contain,
                )),
            title: Text(
              "Bank Transfer",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
            ),
            trailing: Icon(
              Icons.navigate_next,
              color: Colors.black,
              size: 32.sp,
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.r))),
            onPressed: () {
              var user = Get.find<AppController>().user;
              if (user!.saldo > 10000) {
                Get.back(result: 'wallet');
                Get.snackbar("Success!", "Wallet payment success!");
              } else {
                Get.back();
                Get.snackbar("Oops!", "Your saldo not enough");
              }
            },
            child: Padding(
              padding: EdgeInsets.all(16.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Purchase with Vehicle Wallet",
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  SizedBox(
                      height: 20.h,
                      width: 20.w,
                      child: const Icon(Icons.navigate_next)),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Text(
            "Your Vehicle Wallet Ballance IDR ${moneyFormat.format(Get.find<AppController>().user!.saldo)}",
            style: TextStyle(fontSize: 16.sp),
          ),
        ],
      ),
    );
  }
}
