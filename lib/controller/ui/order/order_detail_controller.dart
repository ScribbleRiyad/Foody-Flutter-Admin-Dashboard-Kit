import 'package:foody/helpers/widgets/my_text_utils.dart';
import 'package:foody/model/order_detail.dart';
import 'package:foody/views/my_controller.dart';

class OrderDetailController extends MyController {
  List<OrderDetail> ordersDetail = [];

  List<String> dummyTexts =
      List.generate(12, (index) => MyTextUtils.getDummyText(60));

  List data = [
    {
      "name": "Baklava",
      "image": "assets/images/fast_food/baklava.png",
      "price": 20,
      "quantity": 1,
      "sub_total": 20
    },
    {
      "name": "Barbecue",
      "image": "assets/images/fast_food/barbecue.png",
      "price": 10,
      "quantity": 2,
      "sub_total": 20
    },
    {
      "name": "Burger",
      "image": "assets/images/fast_food/burger.png",
      "price": 15,
      "quantity": 1,
      "sub_total": 15
    },
  ];

  List timeLine = ["Order received", "Processing", "On the way", "Delivered"];

  @override
  void onInit() {
    OrderDetail.dummyList.then((value) {
      ordersDetail = value.sublist(0, 10);
      update();
    });
    super.onInit();
  }
}
