import 'package:get/get.dart';

class MainScreenController extends GetxController {
  final selectedPage = 0.obs;

  void onItemTapped(int index) {
    selectedPage.value = index;
  }
}