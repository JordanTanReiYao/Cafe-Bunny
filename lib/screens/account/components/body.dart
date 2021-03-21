import 'package:Cafe_Bunny/components/default_button.dart';
import 'package:Cafe_Bunny/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:Cafe_Bunny/components/card.dart';
import 'avatar_pic.dart';
import 'package:Cafe_Bunny/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          Text(
            "Alice James",
            style: TextStyle(
              fontSize: 22.0,
              color: Colors.black,
            ),
          ),
          InfoCard(
            titleText: "Title",
            titleColor: kPrimaryColor,
            dataText: "Cultured Bunny",
            dataColor: kSecondaryColor,
          ),
          InfoCard(
            titleText: "Level",
            titleColor: kPrimaryColor,
            dataText: "12",
            dataColor: kSecondaryColor,
          ),
          InfoCard(
            titleText: "Exp Points",
            titleColor: kPrimaryColor,
            dataText: "423 / 1072",
            dataColor: kSecondaryColor,
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.bottomCenter,
            child: DefaultButton(
              text: "Log Out",
              press: () {
                //if aall valid, then navigate to  home screen
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SignInScreen()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
