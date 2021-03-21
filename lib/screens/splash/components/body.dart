import '../../sign_up/sign_up_screen.dart';
import 'package:Cafe_Bunny/size_config.dart';
import 'package:flutter/material.dart';
import '../../../components/default_button.dart';
import 'package:Cafe_Bunny/screens/sign_in/sign_in_screen.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Color kPrimaryColor = Color(0xff118203d);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
            width: double.infinity,
            child: Column(children: <Widget>[
              Expanded(
                flex: 3,
                child: Column(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  Text(
                    "CAFE BUNNY",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(36),
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("Welcome to Cafe Bunny, Let's Hop!"),
                  Spacer(flex: 3),
                  DefaultButton(
                      text: "Sign Up",
                      press: () {
                        Navigator.pushReplacementNamed(
                            context, SignUpScreen.routeName);
                      }),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  DefaultButton(
                      text: "Log In",
                      press: () {
                        Navigator.pushReplacementNamed(
                            context, SignInScreen.routeName);
                      }),
                  SizedBox(height: getProportionateScreenHeight(20)),
                ]),
              )
            ])));
  }
}
