import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../global_config.dart';
import '../models/setting.dart';

ValueNotifier<Setting> setting = new ValueNotifier(new Setting());
ValueNotifier<bool> startPage = ValueNotifier(true);

final navigatorKey = GlobalKey<NavigatorState>();

Future<Setting> initSettings() async {
  Setting _setting;
  try {
    final res = await app_config;
    var response = await jsonEncode(res);

    if (json.decode(response) != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('settings', json.encode(json.decode(response)));
      _setting = Setting.fromJSON(json.decode(response));
      _setting.lang="English";
      _setting.defaultLang=true;
      _setting.mobileLanguage.value = Locale("en", '');
      _setting.brightness.value =prefs.getBool('isDark') ?? false ? Brightness.dark : Brightness.light;
      setting.value = _setting;
      // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
      setting.notifyListeners();
    }
  } catch (e) {
    return Setting.fromJSON({});
  }
  return setting.value;
}


Future<bool>getStartPage()async{

  final SharedPreferences checkStartPage = await SharedPreferences.getInstance();

  final bool? prefStart = checkStartPage.getBool('PREF_START_PAGE');
  if(prefStart ==false){

    startPage.value=false;
  }
  return startPage.value;
}

void setBrightness(Brightness brightness) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (brightness == Brightness.dark) {
    prefs.setBool("isDark", true);
    brightness = Brightness.dark;
  } else {
    prefs.setBool("isDark", false);
    brightness = Brightness.light;
  }
}

Future<void> setDefaultLanguage(String language) async {
  if (language != null) {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', language);
  }
}

Future<String> getDefaultLanguage(defaultLanguage) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.containsKey('language')) {
    defaultLanguage = await prefs.get('language');
  }
  return defaultLanguage;
}

Future<void> saveMessageId(String messageId) async {
  if (messageId != null) {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('google.message_id', messageId);
  }
}

Future<Object?> getMessageId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return await prefs.get('google.message_id');
}
