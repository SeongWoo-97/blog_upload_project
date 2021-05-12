import 'package:flutter/material.dart';

import '../main.dart';
import 'firstPage.dart';

class FourPage extends StatelessWidget {
  const FourPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 4'),
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
                  // 현재페이지 pop -> screen4 push
                  // pushReplacementNamed == popAndPushNamed 같은 기능
                  // pushReplacementNamed 는 Enter 애니메이션
                  // popAndPushNamed 는 Exit 애니메이션
                  // 육안으로 식별 불가
                  stack.removeAt(stack.length - 1);
                  stack.add('Screen2');
                  Navigator.pushReplacementNamed(context, '/screen2');
                },
                child: Text('pushReplacementNamed Screen2'),
              ),
              ElevatedButton(
                onPressed: (){
                  // 현재 페이지 pop -> Screen1 push
                  stack.removeAt(stack.length -1);
                  stack.add('Screen1');
                  Navigator.popAndPushNamed(context, '/screen1');
                },
                child: Text('popAndPushNamed Screen1'),
              ),
              ElevatedButton(
                onPressed: () {
                  stack.removeAt(stack.length - 1);
                  Navigator.of(context).pop();
                },
                child: Text('Pop'),
              ),
              ElevatedButton(
                onPressed: () {
                  stack.removeRange(1, stack.length);
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => FirstPage()), (route) => false);

                },
                child: Text('pushAndRemoveUntil Screen 1'),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.popUntil(context, ModalRoute.withName('/screen2'));
              //   },
              //   child: Text('popUntil'),
              // ),
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
