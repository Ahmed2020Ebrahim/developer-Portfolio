import 'package:get/get.dart';

class ServiceCardController extends GetxController {
  //create instance
  static ServiceCardController get instance => Get.find();

  RxBool isAppServiceSelected = true.obs;

  void selectAppService() {
    isAppServiceSelected.value = true;
  }

  void selectWebService() {
    isAppServiceSelected.value = false;
  }
}
