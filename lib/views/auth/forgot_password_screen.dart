import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foody/controller/auth/forgot_password_controller.dart';
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

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late ForgotPasswordController controller;

  @override
  void initState() {
    controller = Get.put(ForgotPasswordController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      child: GetBuilder(
        init: controller,
        builder: (controller) {
          return MyFlex(
              runAlignment: WrapAlignment.center,
              wrapCrossAlignment: WrapCrossAlignment.center,
              wrapAlignment: WrapAlignment.center,
              contentPadding: false,
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
                    padding: MySpacing.y(28),
                    child: Form(
                        key: controller.basicValidator.formKey,
                        child: Padding(
                          padding: MySpacing.only(left: 50, right: 65),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Center(
                                    child: MyText.displaySmall(
                                      "Forgot Password",
                                      fontWeight: 600,
                                    ),
                                  ),
                                  MySpacing.height(10),
                                  Center(
                                    child: MyText.bodySmall(
                                      "Enter the email address associated with your account and we'll send an email instructions on how to recover your password.",
                                      fontWeight: 600,
                                      textAlign: TextAlign.center,
                                      muted: true,
                                    ),
                                  ),
                                ],
                              ),
                              MySpacing.height(20),
                              TextFormField(
                                validator: controller.basicValidator
                                    .getValidation('email'),
                                controller: controller.basicValidator
                                    .getController('email'),
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  labelText: "Email Address",
                                  hintText: "Email Address",
                                  hintStyle:
                                      MyTextStyle.bodySmall(xMuted: true),
                                  labelStyle:
                                      MyTextStyle.bodySmall(xMuted: true),
                                  border: outlineInputBorder,
                                  prefixIcon: const Icon(
                                    LucideIcons.mail,
                                    size: 20,
                                  ),
                                  contentPadding: MySpacing.all(16),
                                  isCollapsed: true,
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                ),
                              ),
                              MySpacing.height(20),
                              Column(
                                children: [
                                  MyButton.rounded(
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
                                                child:
                                                    CircularProgressIndicator(
                                                  color: theme
                                                      .colorScheme.onPrimary,
                                                  strokeWidth: 1.2,
                                                ),
                                              )
                                            : Container(),
                                        if (controller.loading)
                                          MySpacing.width(16),
                                        MyText.bodySmall(
                                          'Forgot Password',
                                          color: contentTheme.onPrimary,
                                        ),
                                      ],
                                    ),
                                  ),
                                  MyButton.text(
                                    onPressed: controller.gotoLogIn,
                                    elevation: 0,
                                    padding: MySpacing.x(16),
                                    splashColor:
                                        contentTheme.secondary.withOpacity(0.1),
                                    child: MyText.labelMedium(
                                      'Back To Log In',
                                      color: contentTheme.secondary,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
              ]);
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
