import 'package:flutter/material.dart';

class InstaHomePage extends StatelessWidget {
  const InstaHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram'),
        shadowColor: Colors.black,
        elevation: 2,
      ),
      body: Container(
        child: Column(
          children: [
            // Highlights
            Container(
              height: 100,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 50,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child:  Column(
                        children:[ CircleAvatar(
                          backgroundImage: NetworkImage('https://i.pinimg.com/736x/ae/ec/c2/aeecc22a67dac7987a80ac0724658493.jpg'),
                          backgroundColor: index%2 == 0 ? Colors.red : Colors.black,
                          maxRadius: 40,
                        ),
                          Text('Username')
                      ]
                      ),
                    );
                  }),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                  itemBuilder: (context, index){
                  return Container(
                    decoration: BoxDecoration(
                      border: Border(top: BorderSide(
                        color: Colors.grey.shade200
                      ))
                    ),
                    margin: const EdgeInsets.only(top: 4),
                    height: 400,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          height: 50,
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage("https://r2.starryai.com/results/1005156662/01ea57ea-66bd-4bed-a467-11bbdedb43ea.webp"),
                              ),
                              SizedBox(width: 5,),
                              Text('Alina_in95846',style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),)
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage("https://cdn-site-assets.veed.io/Experimenting_Panda_9ce57391cb/Experimenting_Panda_9ce57391cb.webp?width=640&quality=75")
                              )
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          child: Row(
                            children: [
                              IconButton(onPressed: (){}, icon: Icon(Icons.favorite_outline_rounded)),
                              IconButton(onPressed: (){}, icon: Icon(Icons.comment_outlined)),
                              IconButton(onPressed: (){}, icon: Icon(Icons.send_outlined)),
                              Spacer(),
                              IconButton(onPressed: (){}, icon: Icon(Icons.bookmark_border)),

                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
