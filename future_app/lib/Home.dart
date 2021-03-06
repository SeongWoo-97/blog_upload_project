import 'package:flutter/material.dart';
import 'package:future_app/FutureBuilder/User/user_page.dart';
import 'package:future_app/StreamBuilder/FireStorePage.dart';
import 'package:future_app/StreamBuilder/StreamPage.dart';
import 'FutureBuilder/Photo/photoHome.dart';


class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('선택'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UserPage()));
                },
                child: Text('FutureBuilder UserPage 이동')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PhotoPage()));
                },
                child: Text('FutureBuilder PhotoPage 이동')),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => StreamPage()));
              },
              child: Text('StreamBuilder 이동'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => FireStorePage()));
              },
              child: Text('FireStore StreamBuilder 이동'),
            )
          ],
        ),
      ),
    );
  }
}
