import 'package:Cafe_Bunny/home.dart';
import 'package:clippy_flutter/arc.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  var cafeshopped;
  var reviewsgiven;
  var title;
  var couponsclaimed;
  final databaseReference = FirebaseDatabase.instance.reference();

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
        body: Container(
            child: FutureBuilder(
                future: getData(),
                builder: (context, snapshot) {
                  if (snapshot != null) {
                    return SingleChildScrollView(
                        child: Container(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 10),
                                      child: Text("$name",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 28,
                                          ))),
                                  Container(
                                    width: double.infinity,
                                    //height: 200,
                                    child: Container(
                                      alignment: Alignment(0.0, 2.5),
                                      child: CircleAvatar(
                                        backgroundImage: AssetImage(
                                            'assets/sampleprofilepic.png'),
                                        radius: 60.0,
                                      ),
                                    ),
                                  ),
                                  Card(
                                      elevation: 10,
                                      margin:
                                          EdgeInsets.fromLTRB(20, 10, 20, 10),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            const ListTile(
                                              title: Text(
                                                'Title',
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.center,
                                              ),
                                              /*subtitle: Text(
                              'Music by Julie Gable. Lyrics by Sidney Stein.'),*/
                                            ),
                                            Text(
                                              '$title',
                                              style: TextStyle(fontSize: 25),
                                            )
                                            /*TextButton(
                              child: const Text('BUY TICKETS'),
                              onPressed: () {/* ... */},
                            ),
                            const SizedBox(width: 8),
                            TextButton(
                              child: const Text('LISTEN'),
                              onPressed: () {/* ... */},
                            ),
                            const SizedBox(width: 8),*/

                                            ,
                                          ],
                                        ),
                                      )),
                                  Card(
                                      elevation: 10,
                                      margin:
                                          EdgeInsets.fromLTRB(20, 10, 20, 10),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            const ListTile(
                                              title: Text(
                                                'Cafes Hopped',
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Text(
                                              '$cafeshopped',
                                              style: TextStyle(fontSize: 25),
                                            ),
                                          ],
                                        ),
                                      )),
                                  Card(
                                      elevation: 10,
                                      margin:
                                          EdgeInsets.fromLTRB(20, 10, 20, 10),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            const ListTile(
                                              title: Text(
                                                'Coupons Claimed',
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Text(
                                              '$couponsclaimed',
                                              style: TextStyle(fontSize: 25),
                                            ),
                                          ],
                                        ),
                                      )),
                                  Card(
                                      elevation: 10,
                                      margin:
                                          EdgeInsets.fromLTRB(20, 10, 20, 10),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            const ListTile(
                                              title: Text(
                                                'Reviews Given',
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Text(
                                              '$reviewsgiven',
                                              style: TextStyle(fontSize: 25),
                                            ),
                                          ],
                                        ),
                                      )),
                                  RaisedButton(
                                      child: Text('Back to Home Page'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      })
                                ])));
                  } else {
                    return CircularProgressIndicator();
                  }
                })));
  }

  getData() async {
    // ignore: omit_local_variable_types

    var currentUser = await FirebaseAuth.instance.currentUser;
    String userid = currentUser.uid;
    DataSnapshot userData = await databaseReference.child('Users').once();
    //    DataSnapshot userData = await databaseReference.child('Users').orderByChild('uid').equalTo(userid).once();

    name = userData.value[userid]['name'];
    cafeshopped = userData.value[userid]['CafesHopped'];
    reviewsgiven = userData.value[userid]['ReviewsGiven'];
    title = userData.value[userid]['Title'];
    couponsclaimed = userData.value[userid]['CouponsClaimed'];
    return userData.value;
    //return data.value;
    //return refs;
  }
}
