import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:storage_app/app/global/controllers/app_controller.dart';
import 'package:storage_app/app/modules/home/views/home_profile.dart';
import 'package:storage_app/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final moneyFormat = NumberFormat("#,##0", "id_ID");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                showDialog(
                    context: context, builder: (context) => HomeProfile());
              },
              child: CircleAvatar(
                backgroundImage:
                    Get.find<AppController>().user!.picture.isNotEmpty
                        ? NetworkImage(Get.find<AppController>().user!.picture)
                        : null,
                backgroundColor: Colors.red,
              ),
            ),
            SizedBox(
              width: 18.w,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.day,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  Get.find<AppController>().user!.name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(Routes.HISTORY);
              },
              icon: const Icon(
                Icons.wallet,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {
                Get.toNamed(Routes.INSTRUCTION);
              },
              icon: const Icon(
                Icons.info_outline_rounded,
                color: Colors.black,
              ))
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.getListSlot();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 12.h,
                ),
                Stack(
                  children: [
                    Text(
                      "Happy \nStore Vehichle",
                      style: TextStyle(
                          fontSize: 36.sp, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 64),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('Your Current Ballance',
                                  style: TextStyle(
                                      color: Colors.black38,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400)),
                              Obx(
                                () => Text(
                                    'IDR. ${moneyFormat.format(Get.find<AppController>().user!.saldo)}',
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w700)),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                SizedBox(
                  height: 24.h,
                ),
                SizedBox(
                  height: 388.h,
                  child: controller.obx((state) => GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: (150 / 110),
                      addSemanticIndexes: false,
                      controller: controller.scrollController,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                          state!.length,
                          (index) => InkWell(
                                onTap: state[index]['id'] == null
                                    ? () async {
                                        await controller.setSlot(index);
                                      }
                                    : state[index]['id'] ==
                                            Get.find<AppController>().user!.id
                                        ? () {
                                            controller.deleteSlot(index);
                                          }
                                        : null,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: state[index]['id'] == null
                                          ? Colors.grey
                                          : state[index]['id'] !=
                                                  Get.find<AppController>()
                                                      .user!
                                                      .id
                                              ? Colors.pink
                                              : Colors.blueAccent,
                                      borderRadius:
                                          BorderRadius.circular(12.r)),
                                  margin: EdgeInsets.symmetric(
                                      vertical: 22.h, horizontal: 16.w),
                                  child: Center(
                                    child: Text("Slot ${index + 1}"),
                                  ),
                                ),
                              )))),
                ),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 51.w,
                        height: 10.h,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(16.r)),
                      ),
                      Obx(
                        () => Positioned(
                            left: controller.hasScroll.value
                                ? 25 *
                                    (controller.scrollPosition.value /
                                        controller.scrollController.position
                                            .maxScrollExtent)
                                : 0,
                            child: Container(
                              width: 25.w,
                              height: 10.h,
                              decoration: BoxDecoration(
                                  color: Colors.pink,
                                  borderRadius: BorderRadius.circular(16.r)),
                            )),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 28.w,
                      height: 28.h,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Available"),
                    ),
                    Container(
                      width: 28.w,
                      height: 28.h,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.pink),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Used"),
                    ),
                    Container(
                      width: 28.w,
                      height: 28.h,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.blueAccent),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Your Slot"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.h,
                ),
                Center(
                  child: SizedBox(
                    height: 100.h,
                    width: 100.h,
                    child: Image.asset('assets/finger.png'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
