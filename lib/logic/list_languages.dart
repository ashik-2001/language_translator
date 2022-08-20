import 'package:language_picker/languages.dart';
import 'package:language_translator/apiCalls/get_languages.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';

listLanguages(langCodes) {
  List code = [];
  code.clear();
  for (int i = 0; i < langCodes.length; i++) {
    // codes.add(langCodes[i]['languages']);
    code.add(langCodes[i]['languages']);
    // languageNames.add(LocaleNames.of(context)!.nameOf('$code').toString());
  }
  return code;
}
