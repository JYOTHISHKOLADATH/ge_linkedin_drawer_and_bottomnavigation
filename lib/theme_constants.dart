// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData;
  bool isDark;
  ThemeChanger(this._themeData, this.isDark);
  getTheme() => _themeData;
  setTheme(ThemeData theme) {
    if (isDark) {
      theme = lightTheme;
      notifyListeners();
    } else {
      theme = darkTheme;
      notifyListeners();
    }
    _themeData = theme;
    notifyListeners();
  }
}
//_themechanger.setTheme(ThemeData.dark());

ThemeData lightTheme = ThemeData(
    // primarySwatch:Colors.amber,
    primaryColor: Color(0xFFE4001B),
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black54),
    bottomAppBarColor: Color(0xFFFFC50A),
    // appBarTheme: AppBarTheme(backgroundColor: Colors.green),
    unselectedWidgetColor: Color(0xFFF8F9F9),
    backgroundColor: Color(0xFFFFC50A));

ThemeData darkTheme = ThemeData(
    // primarySwatch:Colors.red,
    primaryColor: Color(0xFFFFC50A),
    brightness: Brightness.dark,
    iconTheme: IconThemeData(color: Color(0xFFE4001B)),
    bottomAppBarColor: Color(0xFFE4001B),
    unselectedWidgetColor: Colors.white,
    backgroundColor: Color(0xFFE4001B));
