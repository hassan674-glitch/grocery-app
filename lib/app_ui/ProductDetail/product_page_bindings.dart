import 'package:get/get.dart';
import 'package:grocery_app/app_ui/ProductDetail/product_page_controller.dart';

class ProductPageBindings extends Bindings{
@override
  void dependencies() {
    // TODO: implement dependencies
  Get.lazyPut<ProductPageController>(()=>ProductPageController());
  }
}