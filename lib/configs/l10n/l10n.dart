import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

export 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}

extension LocaleString on AppLocalizations {
  String localeString([String? _localeName]) {
    return <String, String>{
      'pt_BR': 'Português (Brasil)',
      'en_US': 'English (United States)',
    }[_localeName ?? localeName]!;
  }
}
