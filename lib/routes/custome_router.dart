import 'package:flutter/material.dart';
import 'package:lang/pages/about_page.dart';
import 'package:lang/pages/home_page.dart';
import 'package:lang/pages/not_found_page.dart';
import 'package:lang/pages/settings_page.dart';
import 'package:lang/routes/routes_name.dart';


class CustomRouter {

  static Route<dynamic> allRoutes(RouteSettings settings){
    switch(settings.name){
      case homeRoute:
      return MaterialPageRoute(builder: (_) => HomePage());
      case aboutRoute:
      return MaterialPageRoute(builder: (_) => AboutPage());
      case settingsRoute:
      return MaterialPageRoute(builder: (_) => SettingPage());
    }


    return MaterialPageRoute(builder: (_) => NotFoundPage());
  }
}