import 'package:get/get.dart';

import '../controllers/instruction_controller.dart';

class InstructionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InstructionController>(
      () => InstructionController(),
    );
  }
}
