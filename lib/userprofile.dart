import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
//import 'package:google_maps_in_flutter/review.dart';

class UserProfile extends StatefulWidget {
  //final int id;
  //final String name;
  //const DetailsPage(this.id);
  /*ReviewsPage({Key key, @required this.id, @required this.name})
      : super(key: key);*/
  User createState() => User();
}

class User extends State<UserProfile> {
  int id;
  var name;
  var retrieved;
  //List<SingleReview> reviewsList = [];
  //final _textEditingController = TextEditingController();
  //final databaseReference = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('User Profile'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Text("User Profile Page"),
              RaisedButton(
                  child: Text('Back to Home Page'),
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  })
            ])));
  }
}
