import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_i18n/loaders/file_translation_loader.dart';
// import 'package:lang/localization.dart/demo_localization.dart';
import 'package:lang/routes/custome_router.dart';
import 'package:lang/routes/routes_name.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  static void setLocale(BuildContext context, Locale newlocale){
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(newlocale);
  }
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Locale _locale;

  void setLocale(Locale locale){
    setState(() {
      _locale = locale;
    });
  }
  
  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //locale: _locale,
      supportedLocales: const <Locale>[
        Locale('en'),
        Locale('fr'),
      ],
      localizationsDelegates: <LocalizationsDelegate<dynamic>>[
        FlutterI18nDelegate(
          translationLoader: FileTranslationLoader(
            useCountryCode: false,
            basePath: 'lib/assets/i18n',
            fallbackFile: 'fr',
          )
        ),
        // DemoLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
       localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale!.languageCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: CustomRouter.allRoutes,
      initialRoute: homeRoute,
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

