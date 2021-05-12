import 'package:flutter/material.dart';

import 'Class/total.dart';

class NumberCheckPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // arguments
    Total arguments = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('NumberCheckPage'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(arguments.person.name,style: TextStyle(fontSize: 20),),
            Text(arguments.person.age.toString(),style: TextStyle(fontSize: 20),),
            Text(arguments.post.title,style: TextStyle(fontSize: 20),),
            Text(arguments.post.contents.toString(),style: TextStyle(fontSize: 20),),
          ],
        ),
      ),
    );
  }
}
