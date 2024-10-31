import 'package:foody/helpers/theme/theme_customizer.dart';
import 'package:get/get.dart';

abstract class MyController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    ThemeCustomizer.addListener((old, newVal) {
      if (old.theme != newVal.theme ||
          (old.currentLanguage.languageName !=
              newVal.currentLanguage.languageName)) {
        update();
        onThemeChanged();
      }
    });
  }

  void onThemeChanged(){

  }
}
