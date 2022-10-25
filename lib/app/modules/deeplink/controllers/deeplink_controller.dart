import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:get/get.dart';

class DeeplinkController extends GetxController {
  void initDynamicLink() {
    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
      final Uri deepLink = dynamicLinkData.link;
      if (deepLink != null) {
        var dataCalled = deepLink.queryParameters.values.first;
        print('Data Called : $dataCalled');
        // Get.toNamed(dataCalled);
      }
    }).onError((error) {
      print(error.message);
    });
  }

  Future<void> createFirstDynamicLink(String params) async {
    DynamicLinkParameters parameters = DynamicLinkParameters(
      link: Uri.parse('https://www.youtube.com?screen=$params'),
      uriPrefix: 'https://confiatechpartner.page.link',
      androidParameters: AndroidParameters(
        packageName: 'com.confiatech.partner_app',
      ),
    );

    var dynamicLink = await FirebaseDynamicLinks.instance.buildLink(parameters);
    print('Params : $dynamicLink');
  }
}
