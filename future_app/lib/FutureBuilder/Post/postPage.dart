import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  final post;

  const PostPage({Key key, this.post}) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  void initState() {
    super.initState();
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
          future: widget.post,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error');
            } else if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'getData',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    snapshot.data.title,
                    style: TextStyle(fontSize: 20),
                  )
                ],
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
