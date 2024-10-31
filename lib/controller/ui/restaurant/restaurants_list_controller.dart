import 'package:foody/model/restaurant_data.dart';
import 'package:foody/views/my_controller.dart';
import 'package:get/get.dart';

class RestaurantsListController extends MyController {
  List<RestaurantData> restaurant = [];

  @override
  void onInit() {
    RestaurantData.dummyList.then((value) {
      restaurant = value.sublist(0, 10);
      update();
    });
    super.onInit();
  }

  void gotoRestaurantDetail() {
    Get.toNamed('/admin/restaurants/detail');
  }

  void gotoEditScreen() {
    Get.toNamed('/admin/restaurants/edit');
  }

  void gotoAddScreen() {
    Get.toNamed('/admin/restaurants/create');
  }
}
