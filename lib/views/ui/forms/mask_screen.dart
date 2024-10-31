import 'dart:math';

import 'package:foody/controller/ui/forms/mask_controller.dart';
import 'package:foody/helpers/utils/my_shadow.dart';
import 'package:foody/helpers/utils/my_string_utils.dart';
import 'package:foody/helpers/utils/ui_mixins.dart';
import 'package:foody/helpers/widgets/my_breadcrumb.dart';
import 'package:foody/helpers/widgets/my_breadcrumb_item.dart';
import 'package:foody/helpers/widgets/my_card.dart';
import 'package:foody/helpers/widgets/my_flex.dart';
import 'package:foody/helpers/widgets/my_flex_item.dart';
import 'package:foody/helpers/widgets/my_spacing.dart';
import 'package:foody/helpers/widgets/my_text.dart';
import 'package:foody/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foody/helpers/widgets/responsive.dart';
import 'package:foody/views/layout/layout.dart';
import 'package:get/get.dart';

class MaskScreen extends StatefulWidget {
  const MaskScreen({super.key});

  @override
  State<MaskScreen> createState() => _MaskScreenState();
}

class _MaskScreenState extends State<MaskScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late MaskController controller;

  @override
  void initState() {
    controller = MaskController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
        init: controller,
        tag: 'mask_controller',
        builder: (controller) {
          return Column(
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.titleMedium("Form Mask",
                        fontSize: 18, fontWeight: 600),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Form'),
                        MyBreadcrumbItem(name: 'Mask', active: true)
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                  padding: MySpacing.x(flexSpacing / 2),
                  child: MyFlex(
                    children: [
                      MyFlexItem(
                          sizes: 'lg-6 md-6',
                          child: MyCard(
                            borderRadiusAll: 8,
                            shadow: MyShadow(
                                position: MyShadowPosition.bottom,
                                elevation: .5),
                            paddingAll: 23,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText.labelMedium(
                                  "Date Style 1",
                                ),
                                MySpacing.height(8),
                                TextFormField(
                                  inputFormatters: [
                                    DateTextFormatter(),
                                  ],
                                  decoration: InputDecoration(
                                      border: outlineInputBorder,
                                      enabledBorder: outlineInputBorder,
                                      focusedBorder: focusedInputBorder,
                                      contentPadding: MySpacing.all(16),
                                      isCollapsed: true,
                                      helperText: '"dd/mm/yyy"',
                                      helperStyle:
                                          MyTextStyle.bodySmall(muted: true)),
                                ),
                                MySpacing.height(16),
                                MyText.labelMedium(
                                  "Date Style 1",
                                ),
                                MySpacing.height(8),
                                TextFormField(
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(10),
                                    PhoneInputFormatter(),
                                  ],
                                  decoration: InputDecoration(
                                      border: outlineInputBorder,
                                      enabledBorder: outlineInputBorder,
                                      focusedBorder: focusedInputBorder,
                                      contentPadding: MySpacing.all(16),
                                      isCollapsed: true,
                                      helperText: '"123456789"',
                                      helperStyle:
                                          MyTextStyle.bodySmall(muted: true)),
                                ),
                                MySpacing.height(16),
                                MyText.labelMedium(
                                  "Date Style 2",
                                ),
                                MySpacing.height(8),
                                TextFormField(
                                  inputFormatters: [
                                    DateTextFormatter(),
                                  ],
                                  decoration: InputDecoration(
                                      border: outlineInputBorder,
                                      enabledBorder: outlineInputBorder,
                                      focusedBorder: focusedInputBorder,
                                      contentPadding: MySpacing.all(16),
                                      isCollapsed: true,
                                      helperText: '"mm/dd/yyy"',
                                      helperStyle:
                                          MyTextStyle.bodySmall(muted: true)),
                                ),
                              ],
                            ),
                          )),
                      MyFlexItem(
                          sizes: 'lg-6 md-6',
                          child: MyCard(
                            borderRadiusAll: 8,
                            shadow: MyShadow(
                                position: MyShadowPosition.bottom,
                                elevation: .5),
                            paddingAll: 23,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText.labelMedium(
                                  "Mask",
                                ),
                                MySpacing.height(8),
                                TextFormField(
                                  inputFormatters: [
                                    MaskTextFormatter(),
                                  ],
                                  decoration: InputDecoration(
                                      border: outlineInputBorder,
                                      enabledBorder: outlineInputBorder,
                                      focusedBorder: focusedInputBorder,
                                      contentPadding: MySpacing.all(16),
                                      isCollapsed: true,
                                      helperText: '"00-0000000"',
                                      helperStyle:
                                          MyTextStyle.bodySmall(muted: true)),
                                ),
                                MySpacing.height(16),
                                MyText.labelMedium(
                                  "IP address",
                                ),
                                MySpacing.height(8),
                                TextFormField(
                                  inputFormatters: [
                                    IpAddressInputFormatter(),
                                  ],
                                  decoration: InputDecoration(
                                      border: outlineInputBorder,
                                      enabledBorder: outlineInputBorder,
                                      focusedBorder: focusedInputBorder,
                                      contentPadding: MySpacing.all(16),
                                      isCollapsed: true,
                                      helperText: '"99.99.99.99"',
                                      helperStyle:
                                          MyTextStyle.bodySmall(muted: true)),
                                ),
                                MySpacing.height(16),
                                MyText.labelMedium(
                                  "Email address",
                                ),
                                MySpacing.height(8),
                                Form(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value != null && value.isEmpty) {
                                        return 'Email is required';
                                      }
                                      if (value != null &&
                                          !MyStringUtils.isEmail(value)) {
                                        return 'Invalid Email';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        border: outlineInputBorder,
                                        enabledBorder: outlineInputBorder,
                                        focusedBorder: focusedInputBorder,
                                        contentPadding: MySpacing.all(16),
                                        isCollapsed: true,
                                        helperText: '"_@_._"',
                                        helperStyle:
                                            MyTextStyle.bodySmall(muted: true)),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ],
                  )),
            ],
          );
        },
      ),
    );
  }
}

class DateTextFormatter extends TextInputFormatter {
  static const _maxChars = 8;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = _format(newValue.text, '/');
    return newValue.copyWith(text: text, selection: updateCursorPosition(text));
  }

  String _format(String value, String separator) {
    value = value.replaceAll(separator, '');
    var newString = '';
    for (int i = 0; i < min(value.length, _maxChars); i++) {
      newString += value[i];
      if ((i == 1 || i == 3) && i != value.length - 1) {
        newString += separator;
      }
    }
    return newString;
  }

  TextSelection updateCursorPosition(String text) {
    return TextSelection.fromPosition(TextPosition(offset: text.length));
  }
}

//-----------------------Phone Number-----------------------//
class PhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text.replaceAll(RegExp(r'\D'), '');

    return newValue.copyWith(
      text: text.isNotEmpty ? text : '',
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}

//-----------------------IP address-----------------------//
class IpAddressInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    int dotCounter = 0;
    var buffer = StringBuffer();
    String ipField = "";

    for (int i = 0; i < text.length; i++) {
      if (dotCounter < 4) {
        if (text[i] != ".") {
          ipField += text[i];
          if (ipField.length < 3) {
            buffer.write(text[i]);
          } else if (ipField.length == 3) {
            if (int.parse(ipField) <= 255) {
              buffer.write(text[i]);
            } else {
              if (dotCounter < 3) {
                buffer.write(".");
                dotCounter++;
                buffer.write(text[i]);
                ipField = text[i];
              }
            }
          } else if (ipField.length == 4) {
            if (dotCounter < 3) {
              buffer.write(".");
              dotCounter++;
              buffer.write(text[i]);
              ipField = text[i];
            }
          }
        } else {
          if (dotCounter < 3) {
            buffer.write(".");
            dotCounter++;
            ipField = "";
          }
        }
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}

//-----------------------Mask Formatter-----------------------//
class MaskTextFormatter extends TextInputFormatter {
  static const _maxChars = 10;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = _format(newValue.text, '-');
    return newValue.copyWith(text: text, selection: updateCursorPosition(text));
  }

  String _format(String value, String seperator) {
    value = value.replaceAll(seperator, '');
    var newString = '';
    for (int i = 0; i < min(value.length, _maxChars); i++) {
      newString += value[i];
      if ((i == 1) && i != value.length - 1) {
        newString += seperator;
      }
    }
    return newString;
  }

  TextSelection updateCursorPosition(String text) {
    return TextSelection.fromPosition(TextPosition(offset: text.length));
  }
}
