import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/deeplink_controller.dart';

class DeeplinkView extends GetView<DeeplinkController> {
  const DeeplinkView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeeplinkView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DeeplinkView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
