import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/pages/update_TODO_list.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  User? currUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple TODO List"),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(Icons.login_outlined))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              height: 200,
              color: Colors.grey.shade200,
              child: Column(
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration:
                        const InputDecoration(hintText: 'Enter TODO Title'),
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        return 'Please Enter the Title';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (val) {
                      titleController.text = val.toString();
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                        hintText: 'Enter TODO Description'),
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        return 'Please Enter The Description';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (val) {
                      descriptionController.text = val.toString();
                    },
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
                              .add({
                            'title': titleController.text,
                            'description': descriptionController.text
                          });
                        }
                      },
                      child: const Text("Saved"),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: Container(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('user')
                    .doc(currUser!.uid)
                    .collection('todos')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    final docs = snapshot.data!.docs;
                    return ListView.builder(
                        itemCount: docs.length,
                        itemBuilder: (context, index) {
                          return Dismissible(
                            key: ValueKey(docs[index].id),
                            background: Container(color: Colors.red, child: Icon(Icons.delete, color: Colors.white),),
                            onDismissed: (direction) async{
                              await FirebaseFirestore.instance
                              .collection('user')
                                  .doc(currUser!.uid)
                                  .collection('todos')
                                  .doc(docs[index].id)
                                  .delete();
                              // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(docs[index].id)));
                            },
                            child: ListTile(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateTODOList(
                                  title: docs[index]['title'],
                                  description: docs[index]['description'],
                                  toDoId: docs[index].id,
                                )));
                              },
                              title: Text(docs[index]['title']),
                              subtitle: Text(docs[index]['description']),
                            ),
                          );
                        });
                  }
                },
              ),
            ))
          ],
        ),
      ),
    );
  }
}
