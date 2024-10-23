import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:overlay_support/overlay_support.dart';
import 'src/models/setting.dart';
import 'src/pages/main_pages.dart';

import 'generated/l10n.dart';
import './src/repository/settings_repository.dart' as settingRepo;
import 'src/pages/welcome_page.dart';



void main() {
  runApp(OverlaySupport.global(
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    settingRepo.getStartPage();
    settingRepo.initSettings();


  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: settingRepo.setting,
      builder: (BuildContext context, Setting _setting, _) {
        String lang = _setting.mobileLanguage.value.toString();
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          supportedLocales: [
            Locale('en', ''),
            Locale('km', ''),
          ],
          locale: Locale(lang, ''),
          // locale: Locale('en', '') ,
          localizationsDelegates: [
            S.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          // initialRoute: "/Splash",
          // onGenerateRoute: RouteGenerator.generateRoute,

          title: 'NeofiOnline',
          theme: ThemeData(
            //  fontFamily: GoogleFonts.roboto().fontFamily,
            /* textTheme: GoogleFonts.robotoTextTheme(
                  Theme.of(context).textTheme,
                ),*/
            // fontFamily:GoogleFonts.montserrat().fontFamily ,
            // brightness: Brightness.light,
            // dividerColor: config.Colors().accentColor(0.1),
            // focusColor: config.Colors().accentColor(1),
            // primaryColor: config.Colors().orangeColor(1),
            // hintColor: config.Colors().secondColor(1),

            // textTheme:TextTheme(
            //   headlineLarge: TextStyle(fontSize: 24.0,fontFamily: "Montserrat", color: config.Colors().secondColor(1), height: 1.35),
            //   headlineMedium: TextStyle(fontSize: 22.0,fontFamily: "Montserrat", fontWeight: FontWeight.bold, color: config.Colors().secondColor(1), height: 1.35),
            //   headlineSmall: TextStyle(fontSize: 20.0,fontFamily: "Montserrat", fontWeight: FontWeight.w600, color: config.Colors().secondColor(1), height: 1.35),
            //
            //   titleLarge: TextStyle(fontSize: 22.0,fontFamily: "Montserrat", fontWeight: FontWeight.bold, color: config.Colors().secondColor(1), height: 1.5),
            //   titleMedium: TextStyle(fontSize: 18.0,fontFamily: "Montserrat", fontWeight: FontWeight.w600, color: config.Colors().secondColor(1), height: 1.35),
            //   titleSmall: TextStyle(fontSize: 16.0,fontFamily: "Montserrat", fontWeight: FontWeight.w600, color: config.Colors().mainColor(1), height: 1.35),
            //
            //   bodyLarge: TextStyle(fontSize: 16.0,fontFamily: "Montserrat", color: config.Colors().secondColor(1), height: 1.35),
            //   bodyMedium: TextStyle(fontSize: 14.0,fontFamily: "Montserrat", color: config.Colors().secondColor(1), height: 1.35),
            //   bodySmall: TextStyle(fontSize: 12.0,fontFamily: "Montserrat", color: config.Colors().accentColor(1), height: 1.35),
            //
            //   labelLarge: TextStyle(fontSize: 18.0,fontFamily: "Montserrat", color: config.Colors().secondColor(1), height: 1.35,fontWeight: FontWeight.bold),
            //   labelMedium: TextStyle(fontSize: 16.0,fontFamily: "Montserrat", color: config.Colors().secondColor(1), height: 1.35),
            //   labelSmall: TextStyle(fontSize: 14.0,fontFamily: "Montserrat", color: config.Colors().accentColor(1), height: 1.35),
            //
            // ),

            //  useMaterial3: true,
          ),
          home:  settingRepo.startPage.value ? WelcomePage() :MainPages(),
        );
      },
    );
  }
}
