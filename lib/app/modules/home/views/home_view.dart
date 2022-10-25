import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          height: 60.h,
          width: 300.w,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                textStyle: TextStyle(fontSize: 18.sp),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
              ),
              onPressed: () {
                controller.sendPushMessage();
              },
              child: Center(
                  child: Text(
                'Send Notification',
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                ),
              ))),
        ),
      ),
    );
  }
}
