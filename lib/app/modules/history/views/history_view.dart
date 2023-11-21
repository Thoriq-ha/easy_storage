import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:storage_app/app/global/controllers/app_controller.dart';

import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Vehicle Wallet',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(36.h),
            margin: EdgeInsets.all(24.h),
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(25.r)),
            child: Column(
              children: [
                Text(
                  'Total Balance',
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "IDR ",
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      controller.moneyFormat
                          .format(Get.find<AppController>().user!.saldo),
                      style: TextStyle(
                          fontSize: 32.sp, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                SizedBox(
                  height: 40.h,
                ),
                Container(
                  padding: EdgeInsets.all(33.h),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(25.r)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: const [
                          Icon(
                            Icons.cloud_upload_rounded,
                            color: Colors.white,
                          ),
                          Text(
                            "Send",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      Column(
                        children: const [
                          Icon(
                            Icons.cloud_download_rounded,
                            color: Colors.white,
                          ),
                          Text(
                            "Recive",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      Column(
                        children: const [
                          Icon(
                            Icons.wallet,
                            color: Colors.white,
                          ),
                          Text(
                            "Top up",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 0),
            child: Text(
              "History",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(36.h),
                margin: EdgeInsets.all(24.h),
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(25.r)),
                child: controller.obx(
                    (state) => ListView.builder(
                        itemCount: state?.length ?? 0,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => ListTile(
                              title: Text(state![index].title),
                              subtitle: Text(state[index].method.toUpperCase()),
                              trailing: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "IDR ${controller.moneyFormat.format(state[index].price)}",
                                    style: TextStyle(
                                        color: state[index].value == '+'
                                            ? Colors.green
                                            : Colors.red,
                                        fontSize: 18.sp),
                                  ),
                                  Text(
                                    controller.dateFormate
                                        .format(state[index].date.toDate()),
                                    style: TextStyle(
                                        fontSize: 12.sp, color: Colors.grey),
                                  )
                                ],
                              ),
                            )),
                    onEmpty: const Text(
                      "No History Found",
                      textAlign: TextAlign.center,
                    ))),
          )
        ],
      )),
    );
  }
}
