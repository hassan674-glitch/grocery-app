import 'package:get/get.dart';
import 'package:grocery_app/generated/assets.dart';

class CartItem {
  final String name;
  final String image;
  final String unit;
  final double price;
  RxInt quantity;

  CartItem({
    required this.name,
    required this.image,
    required this.unit,
    required this.price,
    required int quantity,
  }) : quantity = quantity.obs;
}

class CartPageController extends GetxController {
  RxList<CartItem> cartItems = <CartItem>[].obs;
  Rx<double> total = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize with some items
    cartItems.addAll([
      CartItem(name: "Bell Pepper Red", image: Assets.imagesBanana, unit: "1kg, Price", price: 4.99, quantity: 1),
      CartItem(name: "Egg Chicken Red", image: Assets.imagesEggs, unit: "4pcs, Price", price: 1.99, quantity: 1),
      CartItem(name: "Organic Bananas", image: Assets.imagesApple, unit: "12kg, Price", price: 3.00, quantity: 1),
      CartItem(name: "Ginger", image:Assets.imagesBulppaper, unit: "250gm, Price", price: 2.99, quantity: 1),
    ]);
    calculateTotal();
  }

  void incrementQuantity(int index) {
    cartItems[index].quantity++;
    calculateTotal();
  }

  void decrementQuantity(int index) {
    if (cartItems[index].quantity > 1) {
      cartItems[index].quantity--;
      calculateTotal();
    }
  }

  void removeItem(int index) {
    cartItems.removeAt(index);
    calculateTotal();
  }

  void calculateTotal() {
    total.value = cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity.value));
  }

  void goToCheckout() {

    print("Going to checkout. Total: \$${total.value.toStringAsFixed(2)}");
  }
}