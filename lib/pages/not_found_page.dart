import 'package:flutter/material.dart';

class NotFoundPage extends StatefulWidget {
  //NotFoundPage({required Key key}) : super(key: key);
  @override

  _NotFoundPageState createState() => _NotFoundPageState();
}

class _NotFoundPageState extends State<NotFoundPage>{
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Touch2build'),
      ),
    );
  }
}