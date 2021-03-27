import 'package:Cafe_Bunny/achievements.dart';
import 'package:Cafe_Bunny/home.dart';
import 'package:flutter/material.dart';
import 'package:Cafe_Bunny/userprofile.dart';
import 'package:Cafe_Bunny/main.dart';
import 'package:Cafe_Bunny/email_login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SideMenu extends StatefulWidget {
  final String userName;
  final String email;
  //const DetailsPage(this.id);
  SideMenu({Key key, @required this.userName, @required this.email})
      : super(key: key);
  NavDrawer createState() => NavDrawer();
}

class NavDrawer extends State<SideMenu> {
  String userName;
  String email;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
              height: 0.33 * MediaQuery.of(context).size.height,
              child: DrawerHeader(
                //padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '$userName',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                        ),
                        //textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/sampleprofilepic.png"),
                        radius: 45.0,
                        // maxRadius: 200.0,
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Text(
                        '$email',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        //textAlign: TextAlign.center,
                      )
                    ]),
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/background3.png'))),
              )),
          ListTile(
            leading: Icon(Icons.verified_user_rounded),
            title: Text('Profile'),
            onTap: () => {navigateToUserPage(context)},
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text('Achievements'),
            onTap: () => {navigateToAchievementPage(context)},
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

  Future navigateToUserPage(context) async {
    print(2345);
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => new UserProfile()));
  }

  Future navigateToAchievementPage(context) async {
    print(2345);
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => new Achievement2()));
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

  void initState() {
    super.initState();
    userName = widget.userName;
    email = widget.email;
    print("username is $userName");
    //name = widget.name;
    //DatabaseReference ref = FirebaseDatabase.instance.reference();
    /*ref.once().then((DataSnapshot snapshot) async {
      print(2234);
      value = snapshot.value;
      print(value);
    });*/
    //print(33445);
    //getData();
  }
}
