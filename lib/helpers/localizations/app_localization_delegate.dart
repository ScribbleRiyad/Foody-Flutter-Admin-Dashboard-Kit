import 'package:flutter/material.dart';
import 'package:foody/helpers/localizations/language.dart';
import 'package:foody/helpers/theme/app_notifire.dart';
import 'package:provider/provider.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate {
  final BuildContext context;

  const AppLocalizationsDelegate(this.context);

  @override
  bool isSupported(Locale locale) =>
      Language.getLanguagesCodes().contains(locale.languageCode);

  @override
  Future load(Locale locale) => _load(locale);

  Future _load(Locale locale) async {
    Provider.of<AppNotifier>(context, listen: false)
        .changeLanguage(Language.getLanguageFromCode(locale.languageCode));
    return;
  }

  @override
  bool shouldReload(LocalizationsDelegate old) => false;
}
