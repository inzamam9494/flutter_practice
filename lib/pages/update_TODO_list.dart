import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UpdateTODOList extends StatefulWidget {
  final String title, description ,toDoId;
  const UpdateTODOList(
      {super.key, required this.title, required this.description, required this.toDoId});

  @override
  State<UpdateTODOList> createState() => _UpdateTODOListState();
}

final TextEditingController titleController = TextEditingController();
final TextEditingController descriptionController = TextEditingController();
User? currUser = FirebaseAuth.instance.currentUser;

class _UpdateTODOListState extends State<UpdateTODOList> {
  @override
  void initState() {
    titleController.text = widget.title;
    descriptionController.text = widget.description;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update TODO'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              height: 200,
              color: Colors.grey.shade200,
              child: Column(
                children: [
                  TextField(
                    controller: titleController,
                    decoration:
                        const InputDecoration(hintText: 'Enter TODO Title'),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                        hintText: 'Enter TODO Description'),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (currUser != null) {
                          await FirebaseFirestore.instance
                              .collection('user')
                              .doc(currUser!.uid)
                              .collection('todos')
                              .doc(widget.toDoId)
                              .update({
                            'title' : titleController.text,
                            'description' : descriptionController.text
                          });
                        }
                      },
                      child: const Text("Update TODO"),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
