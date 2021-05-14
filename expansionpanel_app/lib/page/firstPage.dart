import 'package:expansionpanel_app/class/Ramen.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expansionpanel Example'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: ExpansionPanelList(
            animationDuration: Duration(milliseconds: 1000),
            elevation: 4,
            children: list.map<ExpansionPanel>((Ramen ramen) {
              return ExpansionPanel(
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
                  isExpanded: ramen.expanded,
                  canTapOnHeader: true);
            }).toList(),
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                list[index].expanded = !isExpanded;
              });
            },
          ),
        ),
      ),
    );
  }
}
