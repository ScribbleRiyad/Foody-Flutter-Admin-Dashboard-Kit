import 'package:foody/model/cart_model.dart';
import 'package:foody/views/my_controller.dart';
import 'package:get/get.dart';

class CartController extends MyController {
  late double order = 0, tax = 30, offer = 50, total = 0;
  List<CartData> carts = [];

  bool increaseAble(CartData cart) {
    return cart.quantity < cart.quantity;
  }

  bool decreaseAble(CartData cart) {
    return cart.quantity > 1;
  }

  void increment(CartData cart) {
    cart.quantity++;
    update();
  }

  void decrement(CartData cart) {
    if (!decreaseAble(cart)) return;
    cart.quantity--;
    update();
  }

  void removeData(index) {
    carts.remove(index);
    update();
  }

  void gotoExplore() {
    Get.toNamed('/foods');
  }

  @override
  void onInit() {
    CartData.dummyList.then((value) {
      carts = value.sublist(0, 4);
      update();
    });
    super.onInit();
  }
}
