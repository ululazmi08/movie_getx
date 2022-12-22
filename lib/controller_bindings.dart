import 'package:get/get.dart';
import 'package:movie_getx/controllers/list_movie_controller.dart';

class ControllerBindings extends Bindings {
  void dependencies() {
    Get.put(MovieController());
  }
}
