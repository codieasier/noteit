import 'package:flutter/material.dart';
import 'package:noteit/themes/theme.dart';



class ThemeProvider with ChangeNotifier{
//وقت يبدا يكون lightmode
ThemeData _themeData = lightmode;


ThemeData get themeData=> _themeData;
bool get isDarkMode=>_themeData==darkmode;

set themeData(ThemeData themeData){
  _themeData=themeData;
  notifyListeners();
}

//متع الـtoggle
void toggleTheme(){
  if (_themeData==lightmode){
    themeData= darkmode;
  }else{
    themeData=lightmode;
  }

}

}