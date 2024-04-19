import 'package:flutter/material.dart';
import 'package:flutter_practice/services/api/fetch_posts.dart';

class AddPosts extends StatefulWidget {
  const AddPosts({super.key});

  @override
  State<AddPosts> createState() => _AddPostsState();
}

class _AddPostsState extends State<AddPosts> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  TextEditingController userIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add Posts"),
        shadowColor: Colors.black,
        elevation: 2,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                  hintText: 'title'
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: bodyController,
              decoration: const InputDecoration(
                  hintText: 'body'
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: userIdController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  hintText: 'userId'
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(onPressed: () async {
                await addPosts(
                    titleController.text,
                    bodyController.text,
                    userIdController.text);
              },
                  child: const Text('Upload')),
            )
          ],
        ),
      ),
    );
  }
}
