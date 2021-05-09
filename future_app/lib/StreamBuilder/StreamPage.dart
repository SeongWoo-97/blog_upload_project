import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class StreamPage extends StatefulWidget {
  const StreamPage({Key key}) : super(key: key);

  @override
  _StreamPageState createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  bool _running = true;
  List<Map<String, String>> _chatMessages = [];
  final WebSocketChannel channel = IOWebSocketChannel.connect('wss://echo.websocket.org');
  GlobalKey<FormState> key = GlobalKey();
  TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('StreamBuilder Page'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: sendMessage,
          tooltip: 'Send message',
          child: Icon(Icons.send),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                margin: EdgeInsets.all(10),
                elevation: 1.0,
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
                        return Text(snapshot.data, style: TextStyle(fontSize: 50));
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
                        SizedBox(width: 10),
                        ElevatedButton(onPressed: () => _running = false, child: Text('멈춤')),
                      ],
                    )
                  ],
                ),
              ),
              Card(
                margin: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Center(
                      child: Text('대화형식 StreamBuilder Example'),
                    ),
                    Container(
                      height: 300,
                      child: StreamBuilder(
                        stream: chat(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: Text(
                                    snapshot.data[index]["user"],
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  title: Text(
                                    snapshot.data[index]["message"],
                                    style: TextStyle(fontSize: 15),
                                  ),
                                );
                              });
                        },
                      ),
                    )
                  ],
                ),
              ),
              Card(
                  margin: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Form(
                        key: key,
                        child: TextFormField(
                          controller: textEditingController,
                          decoration: InputDecoration(labelText: "전송할 메시지", border: OutlineInputBorder(borderSide: BorderSide())),
                        ),
                      ),
                      StreamBuilder(
                        stream: channel.stream,
                        builder: (context, snapshot) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 24.0),
                            child: Text(snapshot.hasData ? '${snapshot.data}' : ''),
                          );
                        },
                      )
                    ],
                  ))
            ],
          ),
        ));
  }

  Stream<String> clock() async* {
    while (_running) {
      await Future<void>.delayed(Duration(seconds: 1));
      DateTime _now = DateTime.now();
      yield "${_now.hour} : ${_now.minute} : ${_now.second}";
    }
  }

  Stream<List<Map<String, String>>> chat() async* {
    await Future<void>.delayed(Duration(seconds: 3));
    _chatMessages.add({"user": "삼성", "message": "애플보다 낫지 1"});
    yield _chatMessages;
    await Future<void>.delayed(Duration(seconds: 3));
    _chatMessages.add({"user": "애플", "message": "삼성보다 낫지 1"});
    yield _chatMessages;
    await Future<void>.delayed(Duration(seconds: 3));
    _chatMessages.add({"user": "삼성", "message": "애플보다 낫지 2"});
    yield _chatMessages;
    await Future<void>.delayed(Duration(seconds: 3));
    _chatMessages.add({"user": "애플", "message": "삼성보다 낫지 2"});
    yield _chatMessages;
    await Future<void>.delayed(Duration(seconds: 3));
    _chatMessages.add({"user": "삼성", "message": "애플보다 낫지 3"});
    yield _chatMessages;
    await Future<void>.delayed(Duration(seconds: 3));
    _chatMessages.add({"user": "애플", "message": "삼성보다 낫지 3"});
    yield _chatMessages;
  }

  void sendMessage() {
    if (textEditingController.text.isNotEmpty) {
      FocusScope.of(context).unfocus();
      channel.sink.add(textEditingController.text);
    }
  }
}
