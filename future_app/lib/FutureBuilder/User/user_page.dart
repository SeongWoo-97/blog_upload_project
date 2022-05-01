import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:future_app/FutureBuilder/User/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  Future<User> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = fetchFirstUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http Demo'),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder(
          future: futureUser,
          builder: (context, AsyncSnapshot<User> snapshot) {
            if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else if (snapshot.hasData) {
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
            return CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.next_plan),
        onPressed: () async {
          setState(() {
            futureUser = fetchSecondUser();
          });
        },
      ),
    );
  }

  Future<User> fetchFirstUser() async {
    await Future.delayed(Duration(seconds: 3));
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users/1"));

    if (response.statusCode == 200) {
      toast("Complete First User");
      return User.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  Future<User> fetchSecondUser() async {
    await Future.delayed(Duration(seconds: 3));
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users/2"));

    if (response.statusCode == 200) {
      toast("Complete Second User");
      return User.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }
  void toast(String msg){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.black,
        fontSize: 16.0
    );
  }
}
