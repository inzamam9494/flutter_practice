import 'package:flutter/material.dart';
import 'package:flutter_practice/pages/addPosts.dart';
import 'package:flutter_practice/services/api/fetch_posts.dart';

import '../services/model/post_model.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  List<PostResponse> posts = [];

  @override
  void initState() {
    getPosts();
    super.initState();
  }

  getPosts() async {
    final postTemp = await fetchPosts();
    setState(() {
      posts = postTemp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Posts"),
        shadowColor: Colors.black,
        elevation: 2,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddPosts()));
        },
        child: Icon(Icons.post_add),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(posts[index].body)],
                ),
              );
            }),
      ),
    );
  }
}
