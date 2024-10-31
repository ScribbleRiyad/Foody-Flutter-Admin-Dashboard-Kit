import 'package:foody/model/products_list_data.dart';
import 'package:foody/views/my_controller.dart';
import 'package:get/get.dart';

class FoodController extends MyController {
  List<ProductsListData> productList = [];

  @override
  void onInit() {
    ProductsListData.dummyList.then((value) {
      productList = value.sublist(0, 10);
      update();
    });
    super.onInit();
  }

  void gotoEditScreen() {
    Get.toNamed("/admin/food/edit");
  }

  void gotoAddScreen() {
    Get.toNamed('/admin/food/create');
  }

  void gotoDetailScreen() {
    Get.toNamed("/admin/food/detail");
  }
}
