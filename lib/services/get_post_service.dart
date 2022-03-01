import 'dart:convert';

import 'package:demo_api/models/post.dart';
import 'package:http/http.dart' as http;

class GetPostService {
  //https://jsonplaceholder.typicode.com/posts
  final url = Uri.https('jsonplaceholder.typicode.com', '/posts');

  Future<List<Post>?> getPost() async {
    final response = await http.get(url);
    // print(response.body);

    if (response.statusCode == 200) {
      print(response.statusCode);

      final post = List<Post>.from(
          json.decode(response.body).map((post) => Post.fromJson(post)));
      print(post);

      return post;
    }
  }
}
