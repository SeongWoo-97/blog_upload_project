import 'package:flutter/material.dart';
import 'package:navigator_app/Navigator/firstPage.dart';
import 'package:navigator_app/Navigator/secondPage.dart';

import '../main.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 3'),
        centerTitle: true,
      ),
      body: WillPopScope(
        onWillPop: (){
          return null;
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              stackView(),
              ElevatedButton(
                onPressed: () {
                  stack.add('Screen4');
                  Navigator.pushNamed(context, '/screen4');
                },
                child: Text('Screen4 Push'),
              ),
              ElevatedButton(
                onPressed: () {
                  // 모든페이지 제거 후 특정페이지로 이동
                  stack.removeRange(1, stack.length);
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => FirstPage()), (route) => false);
                },
                child: Text('pushAndRemoveUntil Screen 1'),
              ),
              ElevatedButton(
                onPressed: () {
                  // 현재페이지 pop -> screen4 push
                  stack.removeAt(stack.length - 1);
                  stack.add('Screen4');
                  Navigator.pushReplacementNamed(context, '/screen4');
                },
                child: Text('pushReplacementNamed Screen 4'),
              ),
              ElevatedButton(
                onPressed: () {
                  stack.removeAt(stack.length - 1);
                  Navigator.of(context).pop();
                },
                child: Text('Pop'),
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
