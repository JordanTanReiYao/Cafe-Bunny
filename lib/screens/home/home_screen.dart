import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Cafe_Bunny/components/custom_bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color primaryColor = Color(0xff118203d);
  Color secondaryColor = Color(0xff232c51);
  Color logoGreen = Color(0xff25bcbb);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          child: Column(children: <Widget>[
            Text(
              'Home Screen',
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(color: Colors.white, fontSize: 28),
            )
          ])),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
