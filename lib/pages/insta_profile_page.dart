import 'package:flutter/material.dart';
import 'package:flutter_practice/widgets/insta_profile_display_number.dart';

class InstaProfilePage extends StatefulWidget {
  const InstaProfilePage({super.key});

  @override
  State<InstaProfilePage> createState() => _InstaProfilePageState();
}

class _InstaProfilePageState extends State<InstaProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Grow Fuzion",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
        shadowColor: Colors.black,
        elevation: 2,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            // Profile Pics
            Container(
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.black,
                    maxRadius: 50,
                    child: Text(
                      "gf",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                  const SizedBox(width: 12,),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InstaProfileDisplayNumber(count: '36', label: 'Post',),
                              InstaProfileDisplayNumber(count: '14.4K', label: 'Followers'),
                              InstaProfileDisplayNumber(count: '256', label: 'Following'),
                            ],
                          ),
                        ),
                       Container(
                         margin: const EdgeInsets.only(top: 10),
                         height: 30,
                         width: double.maxFinite,
                         child: ElevatedButton(
                           onPressed: (){},
                           style: ButtonStyle(
                             backgroundColor: MaterialStateProperty.all(Colors.blueAccent)
                           ),
                           child: const Text("Follow",
                           style: TextStyle(color: Colors.white),),
                         ),
                       )
                      ],
                    ),
                  )
                ],
              ),
            ),
            // Profile Bio
            Container(),
            // Highlights
            Container(),
            // Profile Grid
            Container()
          ],
        ),
      ),
    );
  }
}
