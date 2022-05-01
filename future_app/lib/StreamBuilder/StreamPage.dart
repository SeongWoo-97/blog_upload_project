import 'package:flutter/material.dart';
import 'package:future_app/FutureBuilder/User/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class StreamPage extends StatefulWidget {
  @override
  _StreamPageState createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  bool _running = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamBuilder Page'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Center(child: Text('시간 StreamBuilder Example')),
                SizedBox(height: 5),
                StreamBuilder(
                  stream: clock(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    return Text(snapshot.data, style: TextStyle(fontSize: 40));
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() => _running = true);
                        },
                        child: Text('시작')),
                    ElevatedButton(onPressed: () => _running = false, child: Text('멈춤')),
                  ],
                ),
              ],
            ),
          ),
          StreamBuilder(
            stream: fetchFirstUser(),
            builder: (context, AsyncSnapshot<User> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text('대기중');
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('name : ${snapshot.data.name}'),
                    Text('userName : ${snapshot.data.userName}'),
                    Text('email : ${snapshot.data.email}'),
                    Text('phone : ${snapshot.data.phone}'),
                  ],
                );
              }
            },
          )
        ],
      ),
    );
  }

  Stream<String> clock() async* {
    while (_running) {
      await Future.delayed(Duration(milliseconds: 500));
      DateTime _now = DateTime.now();
      yield "${_now.hour} : ${_now.minute} : ${_now.second}";
    }
  }

  Stream<User> fetchFirstUser() async* {
    for (int i = 1; i <= 10; i++) {
      await Future.delayed(Duration(seconds: 2));
      final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users/$i"));

      if (response.statusCode == 200) {
        yield User.fromJson(json.decode(response.body));
      } else {
        yield null;
      }
    }
  }
}
