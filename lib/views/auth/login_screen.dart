import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foody/controller/auth/login_controller.dart';
import 'package:foody/helpers/theme/app_themes.dart';
import 'package:foody/helpers/utils/ui_mixins.dart';
import 'package:foody/helpers/widgets/my_button.dart';
import 'package:foody/helpers/widgets/my_flex.dart';
import 'package:foody/helpers/widgets/my_flex_item.dart';
import 'package:foody/helpers/widgets/my_responsiv.dart';
import 'package:foody/helpers/widgets/my_screen_media_type.dart';
import 'package:foody/helpers/widgets/my_spacing.dart';
import 'package:foody/helpers/widgets/my_text.dart';
import 'package:foody/helpers/widgets/my_text_style.dart';
import 'package:foody/images.dart';
import 'package:foody/views/layout/auth_layout.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late LoginController controller;

  @override
  void initState() {
    controller = Get.put(LoginController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      child: GetBuilder(
        init: controller,
        builder: (controller) {
          return MyFlex(
            contentPadding: false,
            runAlignment: WrapAlignment.center,
            wrapCrossAlignment: WrapCrossAlignment.center,
            wrapAlignment: WrapAlignment.center,
            children: [
              MyFlexItem(
                sizes: "lg-6",
                child: MyResponsive(
                  builder: (_, __, type) {
                    return type == MyScreenMediaType.xxl
                        ? buildAuthSideBar()
                        : type == MyScreenMediaType.xl
                            ? buildAuthSideBar()
                            : type == MyScreenMediaType.lg
                                ? buildAuthSideBar()
                                : const SizedBox();
                  },
                ),
              ),
              MyFlexItem(
                sizes: "lg-6",
                child: Padding(
                  padding: MySpacing.only(left: 50, right: 65),
                  child: Form(
                    key: controller.basicValidator.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        MyText.displaySmall(
                          "LogIn",
                          fontWeight: 600,
                        ),
                        MySpacing.height(32),
                        TextFormField(
                          validator:
                              controller.basicValidator.getValidation('email'),
                          controller:
                              controller.basicValidator.getController('email'),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              labelText: "Email Address",
                              labelStyle: MyTextStyle.bodySmall(xMuted: true),
                              border: outlineInputBorder,
                              prefixIcon: const Icon(
                                LucideIcons.mail,
                                size: 20,
                              ),
                              contentPadding: MySpacing.all(16),
                              isCollapsed: true,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never),
                        ),
                        MySpacing.height(20),
                        TextFormField(
                          validator: controller.basicValidator
                              .getValidation('password'),
                          controller: controller.basicValidator
                              .getController('password'),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: !controller.showPassword,
                          decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: MyTextStyle.bodySmall(xMuted: true),
                              border: outlineInputBorder,
                              prefixIcon: const Icon(
                                LucideIcons.lock,
                                size: 20,
                              ),
                              suffixIcon: InkWell(
                                onTap: controller.onChangeShowPassword,
                                child: Icon(
                                  controller.showPassword
                                      ? LucideIcons.eye
                                      : LucideIcons.eyeOff,
                                  size: 20,
                                ),
                              ),
                              contentPadding: MySpacing.all(16),
                              isCollapsed: true,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () => controller
                                  .onChangeCheckBox(!controller.isChecked),
                              child: Row(
                                children: [
                                  Checkbox(
                                    onChanged: controller.onChangeCheckBox,
                                    value: controller.isChecked,
                                    fillColor:
                                        WidgetStatePropertyAll(Colors.white),
                                    activeColor: theme.colorScheme.primary,
                                    checkColor: contentTheme.primary,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    visualDensity: getCompactDensity,
                                  ),
                                  MySpacing.width(8),
                                  MyText.bodyMedium(
                                    "Remember Me",
                                  ),
                                ],
                              ),
                            ),
                            MyButton.text(
                              onPressed: controller.goToForgotPassword,
                              elevation: 0,
                              padding: MySpacing.xy(8, 0),
                              splashColor:
                                  contentTheme.secondary.withOpacity(0.1),
                              child: MyText.labelSmall(
                                'Forgot password?',
                                color: contentTheme.secondary,
                              ),
                            ),
                          ],
                        ),
                        MySpacing.height(28),
                        Center(
                          child: MyButton.rounded(
                            onPressed: controller.onLogin,
                            elevation: 0,
                            padding: MySpacing.xy(20, 16),
                            backgroundColor: contentTheme.primary,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                controller.loading
                                    ? SizedBox(
                                        height: 14,
                                        width: 14,
                                        child: CircularProgressIndicator(
                                          color: theme.colorScheme.onPrimary,
                                          strokeWidth: 1.2,
                                        ),
                                      )
                                    : Container(),
                                if (controller.loading) MySpacing.width(16),
                                MyText.bodySmall(
                                  'Login',
                                  color: contentTheme.onPrimary,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Center(
                          child: MyButton.text(
                            onPressed: controller.gotoRegister,
                            elevation: 0,
                            padding: MySpacing.x(16),
                            splashColor:
                                contentTheme.secondary.withOpacity(0.1),
                            child: MyText.labelMedium(
                              'I haven\'t account',
                              color: contentTheme.secondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildAuthSideBar() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 700,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage(Images.authSideImage),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
            blendMode: BlendMode.darken,
            child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
            ),
          ),
        ),
        SizedBox(
          height: 700,
          width: 400,
          child: Center(
            child: MyText.displayMedium(
              "${controller.greeting} Welcome",
              textAlign: TextAlign.center,
              color: contentTheme.light,
            ),
          ),
        ),
      ],
    );
  }
}
