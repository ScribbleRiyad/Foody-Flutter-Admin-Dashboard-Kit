import 'package:flutter/material.dart';
import 'package:foody/helpers/services/auth_services.dart';
import 'package:foody/helpers/widgets/my_form_validator.dart';
import 'package:foody/helpers/widgets/my_validators.dart';
import 'package:foody/views/my_controller.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends MyController {
  var greeting = "Good Morning";
  late int currentTime = DateTime.now().hour;

  MyFormValidator basicValidator = MyFormValidator();
  bool showPassword = false, loading = false;

  @override
  void onInit() {
    basicValidator.addField(
      'email',
      required: true,
      label: "Email",
      validators: [MyEmailValidator()],
      controller: TextEditingController(),
    );

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

  Future<void> onLogin() async {
    if (basicValidator.validateForm()) {
      loading = true;
      update();
      var errors = await AuthService.loginUser(basicValidator.getData());
      if (errors != null) {
        basicValidator.validateForm();
        basicValidator.clearErrors();
      }
      Get.toNamed('/auth/reset_password');
      loading = false;
      update();
    }
  }

  void gotoLogIn() {
    Get.toNamed('/auth/login');
  }
}
