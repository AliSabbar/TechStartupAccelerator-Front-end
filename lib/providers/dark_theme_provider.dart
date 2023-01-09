import 'package:flutter/material.dart';
import 'package:housen/network/local/shared_helper.dart';

class DarkModeProvider extends ChangeNotifier {
  bool isDark = false;
  changeTheme({bool? isPref}) {
    if (isPref != null) {
      isDark = isPref;
      notifyListeners();
    } else {
      isDark = !isDark;
      SharedHelper.saveData(key: 'isDark', value: isDark).then((value) {
        notifyListeners();
      }).catchError((e) {
        print(e.toString());
      });
    }
  }

  // changeIcon() {
  //   if (isDark) {
  //     sunnyDark = Icons.sunny;
  //     notifyListeners();
  //   } else {
  //     sunnyDark = Icons.dark_mode_outlined;
  //     notifyListeners();
  //   }
  // }
}
