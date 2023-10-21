import 'package:get/get.dart';
import 'package:snapwork_assignment/app/modules/create%20event/controller/create_event_controller.dart';

class CreateEventBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CreateEventController());
  }
}
