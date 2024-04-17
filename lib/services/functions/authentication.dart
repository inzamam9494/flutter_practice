import 'package:another_flushbar/flushbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_practice/widgets/flushbar.dart';

class Authentication{
  static signUp(BuildContext context,String email, password, firstName, lastName) async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

    //  add user database
      if(credential.user?.uid!=null){
        await FirebaseFirestore.instance.collection('user').doc(credential.user!.uid).set({
          'uid' : credential.user!.uid,
          'firstName' : firstName,
          'lastName' : lastName,
          'email' : email,
          'password' : password
        });
      }

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        FlushBarShow.flushBarErrorMessage('The password provided is too weak.', context);
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        FlushBarShow.flushBarErrorMessage('The account already exists for that email.', context);
      }
    } catch (e) {
      print(e);
      FlushBarShow.flushBarErrorMessage(e.toString(), context);
    }
  }

  static signIn(BuildContext context,String email, password) async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        FlushBarShow.flushBarErrorMessage('No user found for that email.', context);
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        FlushBarShow.flushBarErrorMessage('Wrong password provided for that user.', context);
      }
    }
  }

}