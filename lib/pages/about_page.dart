import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  //AboutPage({required Key key}) : super(key: key);
  @override

  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage>{
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
    );
  }
}