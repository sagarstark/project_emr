import 'package:get/get.dart';
import 'package:project_emr/controllers/controllers.dart';

class ReceptionistBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReceptionistController>(ReceptionistController.new);
  }
}
