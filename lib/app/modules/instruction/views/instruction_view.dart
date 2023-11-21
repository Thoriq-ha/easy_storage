import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controllers/instruction_controller.dart';

class InstructionView extends GetView<InstructionController> {
  const InstructionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 77.h, horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Instructions for Use',
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 144.h,
              ),
              Center(
                child: Obx(
                  () => Text(
                    controller.index < 5
                        ? 'Memasukkan Motor'
                        : 'Mengeluarkan Motor',
                    style:
                        TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  height: 250.h,
                  width: 276.w,
                  child: Obx(
                      () => Image.asset(controller.image[controller.index])),
                ),
              ),
              SizedBox(
                height: 100.h,
              ),
              SizedBox(
                height: 100.h,
                child: Center(
                  child: Obx(
                    () => Text(
                      controller.caption[controller.index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 70.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: controller.onBack,
                        child: Container(
                            width: 184.w,
                            height: 58.h,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(100.r)),
                            child: Center(
                                child: Text(
                              "Back",
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.bold),
                            )))),
                    InkWell(
                        onTap: controller.onNext,
                        child: Container(
                            width: 184.w,
                            height: 58.h,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(100.r)),
                            child: Center(
                                child: Text(
                              "Continue",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ))))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
