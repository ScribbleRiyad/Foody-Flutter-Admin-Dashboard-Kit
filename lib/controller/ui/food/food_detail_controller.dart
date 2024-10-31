import 'package:foody/helpers/utils/my_utils.dart';
import 'package:foody/model/product_data.dart';
import 'package:foody/views/my_controller.dart';

class FoodDetailController extends MyController {
  List<ProductData> products = [];
  var itemCountPlus = 59;
  var itemCount = 1;
  List<String> dummyTexts =
      List.generate(12, (index) => MyTextUtils.getDummyText(60));

  String selectedImage = "assets/images/fast_food/baklava.png";

  List<String> images = [
    "assets/images/fast_food/baklava.png",
    "assets/images/fast_food/barbecue.png",
    "assets/images/fast_food/burger.png",
  ];

  @override
  void onInit() {
    ProductData.dummyList.then((value) {
      products = value;
      update();
    });
    super.onInit();
  }

  void onChangeImage(String image) {
    selectedImage = image;
    update();
  }

  void priceIncrement() {
    itemCount++;
    update();
  }

  void priceDecrement() {
    itemCount--;
    update();
  }
}
