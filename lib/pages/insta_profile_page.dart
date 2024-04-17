import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/pages/insta_home_page.dart';
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
        actions: [
          IconButton(onPressed: (){
            FirebaseAuth.instance.signOut();
          }, icon: const Icon(Icons.login_outlined))
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Pics
            Container(
              padding: const EdgeInsets.all(16),
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
                           onPressed: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context) => InstaHomePage()));
                           },
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Grow Fuzion",style: TextStyle(
                    fontWeight: FontWeight.w800
                  ),),
                  Text("My GitHub Portfolio",
                  style: TextStyle(
                    color: Colors.grey.shade500
                  ),),
                  Text("https://github.com/inzamam9494",
                  style: TextStyle(
                    color: Colors.blue
                  ),),
                  Text("I am Flutter Developer working on India"),
                ],
              ),
            ),
            // Highlights
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                  itemBuilder: (context, index){
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child:  CircleAvatar(
                      backgroundColor: index%2 == 0 ? Colors.red : Colors.black,
                      maxRadius: 40,
                    ),
                  );
                  }),
            ),
            // Profile Grid
            Expanded(
              child: Container(
                child: GridView.builder(
                  itemCount: 100,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2
                    ),
                    itemBuilder: (index, context){
                    return Container(
                      color: Colors.black,
                    );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
