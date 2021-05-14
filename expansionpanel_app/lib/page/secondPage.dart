import 'package:expansionpanel_app/class/Ramen.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<Ramen> list = generateRamen(7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expansionpanel radio Example'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: ExpansionPanelList.radio(
            animationDuration: Duration(milliseconds: 1000),
            children: list.map<ExpansionPanelRadio>((Ramen ramen) {
              return ExpansionPanelRadio(
                value: ramen.id,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text(ramen.header),
                  );
                },
                body: Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: Text(
                    ramen.body,
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
