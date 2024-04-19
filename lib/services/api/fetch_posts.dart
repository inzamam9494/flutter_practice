import 'dart:convert';

import 'package:flutter_practice/pages/update_TODO_list.dart';
import 'package:flutter_practice/services/model/post_model.dart';
import 'package:http/http.dart' as http;

// GET
Future<List<PostResponse>> fetchPosts() async {
  var client = http.Client();
  final response =
      await client.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  if (response.statusCode == 200) {
    List<PostResponse> posts = postResponseFromJson(response.body);
    print(posts);
    print(posts[0].toJson());
    return posts;
  } else {
    return [];
  }
}

// POST
Future<void> addPosts(String title, String body, String userId) async {
  try {
    var client = http.Client();
    final response = await client
        .post(Uri.parse('https://jsonplaceholder.typicode.com/posts'),
            body: jsonEncode({
              'title': title,
              'body': body,
              'userId': userId,
            }),
            headers: {'Content-type': 'application/json; charset=UTF-8'});
    if (response.statusCode >= 200 && response.statusCode < 300) {
      print(response.statusCode);
      print('Success');
    } else {}
  } catch (e) {
    print(e);
  }
}
