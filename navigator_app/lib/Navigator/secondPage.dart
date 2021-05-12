import 'package:flutter/material.dart';
import '../main.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 2'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            stackView(),
            ElevatedButton(
              onPressed: () {
                stack.add('Screen3');
                Navigator.pushNamed(context, '/screen3');
              },
              child: Text('Screen 3 Push'),
            ),
            ElevatedButton(
              onPressed: () {
                // WillPopScope 에서 안됨
                Navigator.maybePop(context, moo());
              },
              child: Text('maybePop'),
            ),
            ElevatedButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  print(stack.length);
                  stack.removeAt(stack.length - 1);
                  Navigator.of(context).pop();
                } else {
                  print('불가');
                }
              },
              child: Text('canPop'),
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

  void moo() {
    stack.removeAt(stack.length - 1);
  }
}
