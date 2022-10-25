import 'package:get/get.dart';

import '../controllers/deeplink_controller.dart';

class DeeplinkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeeplinkController>(
      () => DeeplinkController(),
    );
  }
}
