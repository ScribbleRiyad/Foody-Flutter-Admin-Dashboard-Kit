import 'package:file_picker/file_picker.dart';
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

class AddFoodController extends MyController {
  MyFormValidator basicValidator = MyFormValidator();
  List<PlatformFile> files = [];

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
