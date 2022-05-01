import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStorePage extends StatefulWidget {
  const FireStorePage({Key key}) : super(key: key);

  @override
  _FireStorePageState createState() => _FireStorePageState();
}

class _FireStorePageState extends State<FireStorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FireStore StreamBuilder Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: FirebaseFirestore.instance.collection('hello').doc('world').snapshots(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.done:
                    return Text('연결상태 : done', style: TextStyle(fontSize: 20));
                    break;
                  case ConnectionState.none:
                    return Text('연결상태 : none', style: TextStyle(fontSize: 20));
                    break;
                  case ConnectionState.waiting:
                    return Text('연결상태 : waiting', style: TextStyle(fontSize: 20));
                    break;
                  case ConnectionState.active:
                    if (snapshot.data.exists) {
                      return Text('연결상태 : active \n값: ${snapshot.data['name']}', style: TextStyle(fontSize: 20));
                    } else {
                      return Text('연결상태 : active + 데이터 없음', style: TextStyle(fontSize: 20));
                    }
                    break;
                  default:
                    return Text('default');
                    break;
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
