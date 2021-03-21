import 'package:flutter/material.dart';
import '../sign_in/components/body.dart';
import 'package:firebase_core/firebase_core.dart';

class SignInScreen extends StatelessWidget{
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context){
    Firebase.initializeApp();
    return Scaffold(
      appBar: AppBar(
        title:Text("Sign In"),
      ),
      body: Body(),
    );
  }
}