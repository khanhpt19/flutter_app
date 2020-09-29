import 'package:flutter_app/core/consts/app_consts.dart';

/// [Validations] is validation class all application level.
class Validations {
  static bool lNotNullOrEmpty(List<dynamic> list) =>
      list != null && list.length > 0;

  static bool sNotNullOrEmpty(String string) =>
      (string != null && string.length > 0);

  static bool isUrl(String string) =>
      RegExp(AppConsts.email_regex).firstMatch(string) != null;
}
