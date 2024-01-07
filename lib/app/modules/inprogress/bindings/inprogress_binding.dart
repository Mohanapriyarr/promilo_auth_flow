import 'package:get/get.dart';

import '../controllers/inprogress_controller.dart';

class InprogressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InprogressController>(
      () => InprogressController(),
    );
  }
}
