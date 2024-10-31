
import 'package:foody/helpers/widgets/my_text_utils.dart';
import 'package:foody/views/my_controller.dart';

class CardsController extends MyController {
  List<String> dummyTexts =
      List.generate(12, (index) => MyTextUtils.getDummyText(60));
}
