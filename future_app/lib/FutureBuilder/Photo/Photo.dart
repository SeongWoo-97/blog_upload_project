import 'dart:convert'; // json 사용
import 'package:flutter/foundation.dart'; // compute 사용
import 'package:http/http.dart'; // Client 사용

class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}
// https://jsonplaceholder.typicode.com/photos 있는 5000장 json 불러온다.
Future<List<Photo>> fetchPhotos(Client client) async {
  // response 는 json 형태아님
  final response = await client.get(Uri.https('jsonplaceholder.typicode.com', '/photos'));

  return compute(parsePhotos, response.body);
}
// parsePhotos 함수는 List<Photo> 형에 String responseBody 를 받는 파라미터 선언
// final parsed 는 responseBody 를 json 으로 디코딩 하여 parsed 저장
// json 을 List<Photo> 로 변환후 반환
List<Photo> parsePhotos(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}
