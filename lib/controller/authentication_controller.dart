import 'package:get/state_manager.dart';

class AuthenticationController extends GetxController {
  var processing = false.obs;

  void toggle(bool value) {
    processing.value = value;
  }
}
