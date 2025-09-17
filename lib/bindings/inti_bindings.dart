import 'package:get/get.dart';
import 'package:my_portfolio/controllers/project_card_controller.dart';
import 'package:my_portfolio/controllers/sending_email_controller.dart';
import 'package:my_portfolio/controllers/service_card_controller.dart';

import '../controllers/app_scrolling_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppScrollingController>(() => AppScrollingController());
    Get.lazyPut<SendingEmailController>(() => SendingEmailController());
    Get.lazyPut<ProjectCardController>(() => ProjectCardController());
    Get.lazyPut<ServiceCardController>(() => ServiceCardController());
  }
}
