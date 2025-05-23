import 'package:findet/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

Locale _appLocale = const Locale('ru');

Locale get appLocale => _appLocale;

set appLocale(Locale locale) {
  _appLocale = locale;
}

void setGlobalLocalization(Locale locale, BuildContext context) {
  if (S.delegate.supportedLocales.contains(locale)) {
    FToast().showToast(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(S.of(context).uncorrect_selected_language_error),
          const SizedBox(width: 3),
          SvgPicture.asset('lib/assets/images/icons/emotions/sad.svg')
        ],
      ),
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );

    _appLocale = locale;
  }
}
