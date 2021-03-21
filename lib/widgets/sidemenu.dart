import 'package:Cafe_Bunny/home.dart';
import 'package:flutter/material.dart';
import 'package:Cafe_Bunny/userprofile.dart';
import 'package:Cafe_Bunny/main.dart';
import 'package:Cafe_Bunny/email_login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Side menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/cover.jpg'))),
          ),
          ListTile(
            leading: Icon(Icons.verified_user_rounded),
            title: Text('Profile'),
            onTap: () => {navigateToSubPage(context)},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {_signOut(context)},
          ),
        ],
      ),
    );
  }

  Future navigateToSubPage(context) async {
    print(2345);
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => new UserProfile()));
  }

  Future<void> _signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => MyApp()),
        (Route<dynamic> route) => false);
    /*Navigator.push(
        context, MaterialPageRoute(builder: (_) => new EmailLogIn()));*/
    //runApp(new MaterialApp(home: new EmailLogIn()));
  }
}
