import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controllers/google_sign_in_controller.dart';

class GoogleSignInView extends GetView<GoogleSignInController> {
  const GoogleSignInView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Image.asset('assets/login.png'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 46.h),
                  child: Text(
                    "Let's you in",
                    style:
                        TextStyle(fontSize: 48.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  "Select which google account for one tap login with google",
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 24.h,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r))),
                  onPressed: controller.onGoogleSignInClick,
                  child: Padding(
                    padding: EdgeInsets.all(16.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: 20.h,
                            width: 20.w,
                            child: Image.asset('assets/google.png')),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "Continue With Google",
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
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
