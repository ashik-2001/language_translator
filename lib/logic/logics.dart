import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';


class ChangeLanguage extends ChangeNotifier {
  var toLanguage, fromLanguage;
  ChangeLanguage({this.toLanguage = 'Select lang',this.fromLanguage = 'Select lang'});

  void changeTlanguage(lang){
    toLanguage = lang;
    notifyListeners();
  }
  void changeFlanguage(lang){
    fromLanguage = lang;
    notifyListeners();
  }
}

class ChangePostLanguage extends ChangeNotifier {
  var targetLanguage, sourceLanguage;
  ChangePostLanguage({this.targetLanguage = 'Select lang',this.sourceLanguage = 'Select lang'});

  void changeTargetlanguage(lang){
    targetLanguage = lang;
    notifyListeners();
  }
  void changeSourcelanguage(lang){
    sourceLanguage = lang;
    notifyListeners();
  }
}