import 'package:flutter/material.dart';
import 'package:navigator_app/Navigator/fourPage.dart';
import 'package:navigator_app/Navigator/thirdPage.dart';
import 'package:navigator_app/blankPage.dart';
import 'package:navigator_app/numberCheckPage.dart';

import 'Navigator/firstPage.dart';
import 'Navigator/secondPage.dart';

void main() {
  runApp(MyApp());
}

List<String> stack = ['Screen1'];

class MyApp extends StatelessWidget {
  final ButtonStyle style = ElevatedButton.styleFrom(minimumSize: Size(310, 35), textStyle: TextStyle(fontSize: 18));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(elevatedButtonTheme: ElevatedButtonThemeData(style: style)),
      home: FirstPage(),
      routes: <String, WidgetBuilder>{
        '/screen1': (BuildContext context) => FirstPage(),
        '/screen2': (BuildContext context) => SecondPage(),
        '/screen3': (BuildContext context) => ThirdPage(),
        '/screen4': (BuildContext context) => FourPage(),
        '/blankPage': (BuildContext context) => BlankPage(),
        '/NumberCheckPage': (BuildContext context) => NumberCheckPage(),
      },
    );
  }
}
