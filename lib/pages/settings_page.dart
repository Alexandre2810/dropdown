import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  //SettingPage({required Key key}) : super(key: key);
  @override

  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage>{
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
      ),
    );
  }
}