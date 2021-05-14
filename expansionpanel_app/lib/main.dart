import 'package:expansionpanel_app/page/firstPage.dart';
import 'package:expansionpanel_app/page/secondPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
      routes: <String, WidgetBuilder>{
        'screen1': (BuildContext context) => FirstPage(),
        'screen2': (BuildContext context) => SecondPage(),
      },
    );
  }
}

class Home extends StatelessWidget {
  final ButtonStyle style = ElevatedButton.styleFrom(minimumSize: Size(260, 35), textStyle: TextStyle(fontSize: 16));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('선택'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, 'screen1'),
              child: Text('Expansionpanel Example'),
              style: style,
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, 'screen2'),
              child: Text('Expansionpanel Radio Example'),
              style: style,
            )
          ],
        ),
      ),
    );
  }
}
