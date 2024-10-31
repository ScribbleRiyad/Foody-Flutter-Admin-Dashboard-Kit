import 'package:flutter/material.dart';
import 'package:foody/helpers/services/auth_services.dart';
import 'package:foody/helpers/widgets/my_form_validator.dart';
import 'package:foody/helpers/widgets/my_validators.dart';
import 'package:foody/views/my_controller.dart';
import 'package:get/get.dart';

class LoginController extends MyController {
  MyFormValidator basicValidator = MyFormValidator();

  bool showPassword = false, loading = false, isChecked = false;

  final String _dummyEmail = "foody@getappui.com";
  final String _dummyPassword = "1234567";

  var greeting = "Good Morning";
  late int currentTime = DateTime.now().hour;

  @override
  void onInit() {
    basicValidator.addField('email',
        required: true,
        label: "Email",
        validators: [MyEmailValidator()],
        controller: TextEditingController(text: _dummyEmail));

    basicValidator.addField('password',
        required: true,
        label: "Password",
        validators: [MyLengthValidator(min: 6, max: 10)],
        controller: TextEditingController(text: _dummyPassword));

    if ((currentTime < 6) || (currentTime > 21)) {
      greeting = 'Good Night';
    } else if (currentTime < 12) {
      greeting = 'Good Morning';
    } else if (currentTime < 18) {
      greeting = 'Good Afternoon';
    } else if (currentTime < 22) {
      greeting = 'Good Evening';
    }
    super.onInit();
  }

  void onChangeCheckBox(bool? value) {
    isChecked = value ?? isChecked;
    update();
  }

  void onChangeShowPassword() {
    showPassword = !showPassword;
    update();
  }

  Future<void> onLogin() async {
    if (basicValidator.validateForm()) {
      loading = true;
      update();
      var errors = await AuthService.loginUser(basicValidator.getData());
      if (errors != null) {
        basicValidator.addErrors(errors);
        basicValidator.validateForm();
        basicValidator.clearErrors();
      } else {
        String nextUrl =
            Uri.parse(ModalRoute.of(Get.context!)?.settings.name ?? "")
                    .queryParameters['next'] ??
                "/home";
        Get.toNamed(
          nextUrl,
        );
      }
      loading = false;
      update();
    }
  }

  void goToForgotPassword() {
    Get.toNamed('/auth/forgot_password');
  }

  void gotoRegister() {
    Get.offAndToNamed('/auth/register_account');
  }
}
