import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:foody/helpers/widgets/my_form_validator.dart';
import 'package:foody/views/my_controller.dart';

enum Category {
  Fruits,
  Vegetable,
  Dairy,
  Bakery,
  Snacks,
  Beverages,
  Rice;

  const Category();
}

enum Status {
  inStock,
  OutOfStock;

  const Status();
}

class FoodEditController extends MyController {
  MyFormValidator basicValidator = MyFormValidator();
  List<PlatformFile> files = [];

  final String _dummyProductName = "Cheese Rolls";
  final String _dummyDescription =
      "With tender, delicate and loosely packed green leaves, Lettuce gives a crunchy and fresh feel to burgers and sandwiches. Nulla nibh diam, blandit vel consequat nec, ultrices et ipsum. Nulla varius magna a consequat pulvinar.";
  final String _dummyPrice = "\$95";
  final String _dummyQty = "2";


  @override
  void onInit() {
    basicValidator.addField('name',
        controller: TextEditingController(text: _dummyProductName));
    basicValidator.addField('description',
        controller: TextEditingController(text: _dummyDescription));
    basicValidator.addField('price',
        controller: TextEditingController(text: _dummyPrice));
    basicValidator.addField('qty',
        controller: TextEditingController(text: _dummyQty));
    super.onInit();
  }

  Future<void> pickFile() async {
    var result = await FilePicker.platform.pickFiles();
    if (result?.files[0] != null) {
      files.add(result!.files[0]);
    }
    update();
  }

  void removeFile(PlatformFile file) {
    files.remove(file);

    update();
  }
}
