import 'package:flutter/material.dart';
import '../sign_up/components/body.dart';
import 'package:firebase_core/firebase_core.dart';

class SignUpScreen extends StatelessWidget{
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context){
    Firebase.initializeApp();
    return Scaffold(
      appBar: AppBar(
        title:Text("Sign Up"),
      ),
      body: Body(),
    );
  }
}