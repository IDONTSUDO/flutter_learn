import 'package:flutter/cupertino.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'generated/l10n.dart';
part 'locale_full_name.dart';

class StringProvider extends ChangeNotifier {
  static AppLocalization l10n = AppLocalization();

  factory StringProvider() => _instance;
  static final StringProvider _instance = StringProvider._();

  StringProvider._();

  static String? localeFullName(String languageCode) {
    return _localeFullName[languageCode];
  }

  void setup(AppLocalization value) {
    l10n = value;
    notifyListeners();
  }

  Future<void> setLocale(Locale locale) async {
    initializeDateFormatting(locale.countryCode);
    await AppLocalization.delegate.load(locale);
  }

  List<Locale> getSupportedLocale() {
    return AppLocalization.delegate.supportedLocales;
  }
}

extension WithContext on BuildContext {
  AppLocalization get l10n => StringProvider.l10n;
}
