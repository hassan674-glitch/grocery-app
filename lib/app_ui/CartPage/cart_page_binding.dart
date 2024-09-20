import 'package:get/get.dart';

import 'cart_page_controller.dart';

class CartPageBinding  extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CartPageController>(()=>CartPageController());
  }

}