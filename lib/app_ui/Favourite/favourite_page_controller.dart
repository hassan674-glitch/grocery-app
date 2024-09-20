import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:grocery_app/app_ui/CartPage/cart_page_controller.dart';
import 'package:grocery_app/generated/assets.dart';
class FavouriteItem {
  final String name;
  final String image;
  final String unit;
  final double price;
  RxInt quantity;

  FavouriteItem({
    required this.name,
    required this.image,
    required this.unit,
    required this.price,
    required int quantity,
  }) : quantity = quantity.obs;
}
class FavouritePageController extends GetxController{
 RxList<FavouriteItem> favouriteItem=<FavouriteItem>[].obs;
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
   favouriteItem.addAll([
     FavouriteItem(name: "CocaCola", image:Assets.imagesCocacola, unit: "32 ml", price:18, quantity: 1),
     FavouriteItem(name: "Sprite Can", image:Assets.imagesSprite, unit: "35 ml", price:10, quantity: 1),
     FavouriteItem(name: "Apple And Grape Juice", image:Assets.imagesTreetop, unit: "25 ml", price:5, quantity: 1),
     FavouriteItem(name: "Pepsi Can", image:Assets.imagesPepsi, unit: "30 ml", price:20, quantity: 1),

   ]);
  }
}