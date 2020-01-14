import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:revival_tv/screen/main_screen.dart';

void main() => runApp(new MainApp());

class MainApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Login App',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MainScreen(),
    );
  }


}