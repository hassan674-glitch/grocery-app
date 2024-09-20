import 'package:get/get.dart';
import 'package:grocery_app/generated/assets.dart';

class HomePageItems{
  final String name ;
  final String unit;
  final int price;
  final String image;
  HomePageItems({required this.name, required this.unit, required this.price, required this.image,} );
}

class HomePageController extends GetxController {
RxList<HomePageItems> homePageItems=<HomePageItems>[].obs;
RxList<HomePageItems> exclusiveOfferItems = <HomePageItems>[].obs;
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    homePageItems.addAll([
      HomePageItems(name: 'Meat', unit: '1Kg price', price: 3, image: Assets.imagesBigmeat),
      HomePageItems(name: 'Chicken', unit: '1Kg price', price: 3, image: Assets.imagesChicken),
      HomePageItems(name: 'Rice', unit: '1Kg price', price: 3, image: Assets.imagesRice),
    HomePageItems(name: 'Tomato', unit: '1Kg price', price: 3, image: Assets.imagesBulppaper),
    ]);
    // Exclusive Offer Items
    exclusiveOfferItems.addAll([
      HomePageItems(name: 'Banana', unit: '7 Pieces', price: 10, image: Assets.imagesBanana),
      HomePageItems(name: 'Apple', unit: '7 Pieces', price: 12, image: Assets.imagesApple),
      HomePageItems(name: 'Coke', unit: '1L Bottle', price: 5, image: Assets.imagesCocacola),
      HomePageItems(name: 'Peach', unit: '1Kg Price', price: 8, image: Assets.imagesPeach),
    ]);

  }
}
