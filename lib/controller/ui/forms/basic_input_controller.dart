import 'package:flutter/material.dart';
import 'package:foody/helpers/extention/date_time_extention.dart';
import 'package:foody/views/my_controller.dart';
import 'package:get/get.dart';

enum Gender {
  male,
  female;

  const Gender();
}

enum TextFieldBorderType { outline, underline, none }

class BasicInputController extends MyController {
  bool filled = false;
  bool disabled = true;
  bool readOnly = false;
  bool helperText = false;
  bool pilled = false;
  bool inlineText = false;
  bool prefixIcon = false;
  bool suffixIcon = false;

  FloatingLabelBehavior floatingLabelBehavior = FloatingLabelBehavior.always;
  TextFieldBorderType borderType = TextFieldBorderType.outline;

  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  DateTimeRange? selectedDateTimeRange;
  DateTime? selectedDateTime;

  Gender selectedGender = Gender.male;

  void onChangeLabelType(FloatingLabelBehavior value) {
    floatingLabelBehavior = value;
    update();
  }

  OutlineInputBorder? get inputBorder {
    if (borderType == TextFieldBorderType.underline) {
      return null;
    }

    if (borderType == TextFieldBorderType.none) {
      return OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(pilled ? 30 : 8)),
          borderSide: BorderSide.none);
    }
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(pilled ? 30 : 8)),
    );
  }

  void onChangedFilledChecked(bool? value) {
    filled = value ?? filled;
    update();
  }

  void onChangedDisabledChecked(bool? value) {
    disabled = value ?? disabled;
    update();
  }

  void onChangedReadOnlyChecked(bool? value) {
    readOnly = value ?? readOnly;
    update();
  }

  void onChangedHelperTextChecked(bool? value) {
    helperText = value ?? helperText;
    update();
  }

  void onChangedPilledChecked(bool? value) {
    pilled = value ?? pilled;
    update();
  }

  void onChangedInlineTextChecked(bool? value) {
    inlineText = value ?? inlineText;
    update();
  }

  void onChangedPrefixIconChecked(bool? value) {
    prefixIcon = value ?? prefixIcon;
    update();
  }

  void onChangedSuffixIconChecked(bool? value) {
    suffixIcon = value ?? suffixIcon;
    update();
  }

  void onChangeBorderType(TextFieldBorderType value) {
    borderType = value;
    if (borderType == TextFieldBorderType.none) {
      filled = true;
    }
    update();
  }

  Future<void> pickDate() async {
    final DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate ?? DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      update();
    }
  }

  Future<void> pickTime() async {
    final TimeOfDay? picked = await showTimePicker(
        context: Get.context!, initialTime: selectedTime ?? TimeOfDay.now());
    if (picked != null && picked != selectedTime) {
      selectedTime = picked;
      update();
    }
  }

  Future<void> pickDateRange() async {
    final DateTimeRange? picked = await showDateRangePicker(
        context: Get.context!,
        initialEntryMode: DatePickerEntryMode.input,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDateTimeRange) {
      selectedDateTimeRange = picked;
      update();
    }
  }

  Future<void> pickDateTime() async {
    final DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate ?? DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
          context: Get.context!, initialTime: selectedTime ?? TimeOfDay.now());
      if (pickedTime != null) {
        selectedDateTime = pickedDate.applied(pickedTime);
        update();
      }
    }
  }

  void onChangeGender(Gender? value) {
    selectedGender = value ?? selectedGender;
    update();
  }
}
