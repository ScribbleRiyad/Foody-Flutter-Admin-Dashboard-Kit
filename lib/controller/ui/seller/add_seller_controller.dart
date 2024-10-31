import 'package:foody/helpers/widgets/my_form_validator.dart';
import 'package:foody/views/my_controller.dart';

enum Country {
  UnitedState,
  Canada,
  Australia,
  Germany,
  Bangladesh,
  China,
  Bharat,
  Brazil;

  const Country();
}

enum StateName {
  Assam,
  Bihar,
  Chhattisgarh,
  Goa,
  Gujarat,
  Kerala,
  Mizoram;

  const StateName();
}

class AddSellerController extends MyController {
  MyFormValidator basicValidator = MyFormValidator();
}
