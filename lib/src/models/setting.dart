import 'package:flutter/material.dart';

class Setting {
  String? message;
  String appName = '';
  double? defaultTax;
  String? orangeColor;
  String? holderColor;
  String? cancelColor;
  String? validateColor;
  String? mainColor;
  String? mainDarkColor;
  String? secondColor;
  String? secondDarkColor;
  String? accentColor;
  String? accentDarkColor;
  String? scaffoldDarkColor;
  String? scaffoldColor;
  String? googleMapsKey;
  String? fcmKey;
  String? dateReleased;
  ValueNotifier<Locale> mobileLanguage = new ValueNotifier(Locale('en', ''));
  String? lang="";
  bool defaultLang=true;
  String? appVersion;
  bool enableVersion = true;

  List<String> homeSections = [];

  ValueNotifier<Brightness> brightness = new ValueNotifier(Brightness.light);
  Setting();
  Setting.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      lang = jsonMap['lang'] ?? null;
      defaultLang = jsonMap['defaultLang'] ?? null;
      appName = jsonMap['appName'] ?? null;
      orangeColor = jsonMap['orangeColor'] ?? null;
      holderColor = jsonMap['holderColor'] ?? null;
      cancelColor = jsonMap['cancelColor'] ?? null;
      validateColor = jsonMap['validateColor'] ?? null;
      mainColor = jsonMap['mainColor'] ?? null;
      mainDarkColor = jsonMap['mainDarkColor'] ?? '';
      secondColor = jsonMap['secondColor'] ?? '';
      secondDarkColor = jsonMap['secondDarkColor'] ?? '';
      accentColor = jsonMap['accentColor'] ?? '';
      accentDarkColor = jsonMap['accentDarkColor'] ?? '';
      scaffoldDarkColor = jsonMap['scaffoldDarkColor'] ?? '';
      scaffoldColor = jsonMap['scaffoldColor'] ?? '';
      googleMapsKey = jsonMap['googleMapsKey'] ?? null;
      fcmKey = jsonMap['fcmKey'] ?? null;
      mobileLanguage.value = Locale(jsonMap['mobileLanguage'] ?? "en", '');
      appVersion = jsonMap['appVersion'] ?? '';
      dateReleased = jsonMap['dateReleased'] ?? '';

      enableVersion =
      jsonMap['enableVersion'] == null || jsonMap['enableVersion'] == '0'
          ? false
          : true;
      // for (int _i = 1; _i <= 12; _i++) {
      //   homeSections.add(jsonMap['home_section_' + _i.toString()] != null ? jsonMap['home_section_' + _i.toString()] : 'empty');
      // }
    } catch (e) {

      print(e);
    }
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["appName"] = appName;
    map["languageCode"] = mobileLanguage.value.languageCode;
    return map;
  }

  @override
  String toString() {
    return 'Setting{message: $message, appName: $appName, defaultTax: $defaultTax, mainColor: $mainColor, mainDarkColor: $mainDarkColor, secondColor: $secondColor, secondDarkColor: $secondDarkColor, accentColor: $accentColor, accentDarkColor: $accentDarkColor, scaffoldDarkColor: $scaffoldDarkColor, scaffoldColor: $scaffoldColor, googleMapsKey: $googleMapsKey, fcmKey: $fcmKey, mobileLanguage: $mobileLanguage, appVersion: $appVersion, enableVersion: $enableVersion, homeSections: $homeSections, brightness: $brightness}';
  }
}
