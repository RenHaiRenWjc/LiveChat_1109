import 'package:get/get.dart';

class MainController extends GetxController {
  int currentIndex = 0;

  onBottomTap(int index) {
    currentIndex = index;
    update();
  }
}
