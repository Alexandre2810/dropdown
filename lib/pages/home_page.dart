//import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:lang/classes/language.dart';
import 'package:lang/main.dart';
//import 'package:lang/routes/routes_name.dart';

class HomePage extends StatefulWidget {
  @override

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  final GlobalKey<FormState> _key = GlobalKey<FormState>();


  void _changeLanguage(Language language){
    late Locale _temp;
    switch(language.languageCode){
      case 'fr':
      _temp = Locale(language.languageCode);
      break;
      case 'en':
      _temp = Locale(language.languageCode);
      break;
      // default:
      // _temp = Locale(language.languageCode);
    }

    MyApp.setLocale(context, _temp);
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: _drawerList(),
      appBar: AppBar(
        title: Text(FlutterI18n.translate(context, "APP.hi")),
        actions: <Widget>[
          Padding(padding: EdgeInsets.all(8.0),
          child: DropdownButton(
            
            underline: SizedBox(),
            icon: Icon(Icons.language,color: Colors.white,),
            onChanged: (Language? language) async{
                _changeLanguage(language!);
              },
            items: Language.languageList()
                  .map<DropdownMenuItem<Language>>(
                    (e) => DropdownMenuItem<Language>(
                      value: e,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            e.languageCode,
                            style: TextStyle(fontSize: 20),
                          ),
                          // Text(e.name)
                        ],
                      ),
                    ),
                  )
                  .toList(),
          ),)
        ],
      ),
    );
  }
}

