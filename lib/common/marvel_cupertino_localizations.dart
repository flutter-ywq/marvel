import 'package:flutter/cupertino.dart';

/// @description MarvelCupertinoLocalisationsDelegate
///
/// @author 燕文强
///
/// @date 2020/3/11
class MarvelCupertinoLocalizations {
  static const _CupertinoLocalizationsDelegate delegate = _CupertinoLocalizationsDelegate();
}

class _CupertinoLocalizationsDelegate extends LocalizationsDelegate<CupertinoLocalizations> {
  const _CupertinoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<CupertinoLocalizations> load(Locale locale) => DefaultCupertinoLocalizations.load(locale);

  @override
  bool shouldReload(_CupertinoLocalizationsDelegate old) => false;
}
