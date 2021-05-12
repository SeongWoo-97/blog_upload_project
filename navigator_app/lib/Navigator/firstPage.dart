import 'package:flutter/material.dart';
import 'package:navigator_app/Navigator/secondPage.dart';

import '../main.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 1'),
        centerTitle: true,
      ),
      body: WillPopScope(
        onWillPop: () {
          return null;
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              stackView(),
              ElevatedButton(
                onPressed: () {
                  stack.add('Screen2');
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()));
                },
                child: Text('Screen2 Push'),
              ),
              ElevatedButton(
                onPressed: () {
                  stack.add('Screen2');
                  Navigator.pushNamed(context, '/screen2');
                },
                child: Text('Screen2 PushNamed'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget stackView() => Container(
        width: 100,
        height: (stack.length).floorToDouble() * 32,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Center(
              child: Container(
                margin: EdgeInsets.all(1),
                width: 100,
                height: 30,
                child: Center(
                  child: Text(
                    stack[index],
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                decoration: BoxDecoration(border: Border.all(color: Colors.grey, width: 1)),
              ),
            );
          },
          itemCount: stack.length,
          reverse: true,
        ),
      );
}
