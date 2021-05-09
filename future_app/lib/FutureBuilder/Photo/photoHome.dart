import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'Photo.dart';

class PhotoPage extends StatelessWidget {
  PhotoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PhotoPage'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: fetchPhotos(Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error'));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            List<Photo> photos = snapshot.data;
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemCount: photos.length,
                itemBuilder: (context, index) {
                  return Image.network(snapshot.data[index].thumbnailUrl);
                });
          }
        },
      ),
    );
  }
}
