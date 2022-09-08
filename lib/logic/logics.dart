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

// class ChangePostLanguage extends ChangeNotifier {
//   var toLanguage, fromLanguage;
//   ChangePostLanguage({this.toLanguage = 'Select lang',this.fromLanguage = 'Select lang'});

//   void changeTlanguage(lang){
//     toLanguage = lang;
//     notifyListeners();
//   }
//   void changeFlanguage(lang){
//     fromLanguage = lang;
//     notifyListeners();
//   }
// }