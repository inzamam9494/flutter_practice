import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/pages/authentication_form.dart';
import 'package:flutter_practice/pages/home_page.dart';
import 'package:flutter_practice/pages/insta_home_page.dart';
import 'package:flutter_practice/pages/insta_profile_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot){
             if(snapshot.hasData){
               return HomePage();
             }else{
               return AuthenticationForm();
             }
          }),
    );
  }
}
