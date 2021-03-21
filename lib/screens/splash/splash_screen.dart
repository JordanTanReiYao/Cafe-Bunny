import 'package:Cafe_Bunny/screens/splash/components/body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Cafe_Bunny/size_config.dart';
import 'package:firebase_core/firebase_core.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    ); //scaffold
  }
}
