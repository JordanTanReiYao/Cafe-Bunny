import 'package:Cafe_Bunny/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:Cafe_Bunny/reviewspage.dart';
import 'package:firebase_auth/firebase_auth.dart';

/*void main() {
  runApp(MaterialApp(
    home: DetailsPage(),
  ));
}*/

class DetailsPage extends StatefulWidget {
  Function callback;

  final int id;
  //const DetailsPage(this.id);
  DetailsPage({Key key, @required this.id, this.callback}) : super(key: key);
  SubPage createState() => SubPage();
}

class SubPage extends State<DetailsPage> {
  //final int id;
  DataSnapshot userData;
  int id;
  String name;
  //SubPage({Key key, @required this.id}) : super(key: key);
  final databaseReference = FirebaseDatabase.instance.reference();
  var picture;
  var currentUser;
  //'https://icon-library.com/images/cafe-icon-png/cafe-icon-png-0.jpg';
  var value;
  var nameId;
  var visitflag;
  var location;
  var opening_hours;
  var rating;
  List visitslist;
  //var name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cafe Details'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
            child: FutureBuilder(
                future: getData(),
                builder: (context, snapshot) {
                  if (snapshot != null) {
                    if (picture != null) {
                      return Center(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Flexible(
                                        child: Text(
                                      '$name',
                                      style: TextStyle(
                                          fontSize: 35,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ))
                                  ]),
                              /*FittedBox(
                                  child: FadeInImage.assetNetwork(
                                    placeholder: 'assets/dark-loader.gif',
                                    image: picture,
                                  ),
                                  fit: BoxFit.fill),*/
                              Container(
                                width: MediaQuery.of(context).size.width,
                                //height: 100,
                                child: FadeInImage.assetNetwork(
                                    placeholder: 'assets/loader2.gif',
                                    image: picture,
                                    fit: BoxFit.contain),
                              ),
                              /*Image.network(
                                  picture),*/ //'assets/Suko Thai Cafe.jpg'),
                              Column(children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                    child: Text('Address',
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center)),
                                Text(
                                  '$location',
                                  style: TextStyle(fontSize: 20),
                                  textAlign: TextAlign.center,
                                )
                              ]),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                                  child: Text('Operating Hours',
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center)),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  child: Text(
                                    '$opening_hours',
                                    //'Monday: 8am–8pm\nTuesday:	8am–8pm\nWednesday:	8am–8pm\nThursday:	8am–8pm\nFriday:	8am–8pm\nSaturday:	9am–2pm\nSunday:	Closed',
                                    style: TextStyle(fontSize: 22),
                                    textAlign: TextAlign.center,
                                  )),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 15, 0, 5),
                                  child: Text('Average Rating',
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.start)),
                              Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 15),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          '$rating' + ' ',
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Image.asset(
                                          'assets/ratings star.png',
                                          width: 30,
                                          height: 30,
                                        )
                                      ])),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    /*Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 10, 0, 15),
                                        child:*/
                                    Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            5, 0, 10, 20),
                                        child: ButtonTheme(
                                            height: 42,
                                            child: visitflag == '0'
                                                ? RaisedButton(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0)),
                                                    textColor: Colors.white,
                                                    color: Colors.blueAccent,
                                                    child: Text(
                                                      'Hop to Cafe',
                                                      style: TextStyle(
                                                          fontSize: 23),
                                                    ),
                                                    onPressed: () => {
                                                          setState(() => {
                                                                visitflag = '1',
                                                                HopToCafe()
                                                              }),
                                                          this.widget.callback(
                                                              new MainMap()),
                                                          setState(() => {
                                                                visitflag = '1',
                                                              })
                                                        })
                                                : RaisedButton(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0)),
                                                    textColor: Colors.white,
                                                    color: Colors.blueGrey,
                                                    child: Text(
                                                      'Cafe Hopped!!',
                                                      style: TextStyle(
                                                          fontSize: 23),
                                                    ),
                                                    onPressed: null)))
//        setState(() {
//          //change the currentPage in RootPage so it switches FeedPage away and gets a new class that I'll make
//        });HopToCafe()}))) //),
                                    ,
                                    Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            10, 0, 5, 20),
                                        child: ButtonTheme(
                                            height: 42,
                                            child: RaisedButton(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0)),
                                                textColor: Colors.white,
                                                color: Colors.blueAccent,
                                                child: Text(
                                                  'View Reviews',
                                                  style:
                                                      TextStyle(fontSize: 23),
                                                ),
                                                onPressed: () {
                                                  navigateToReviewsPage(
                                                      context, id, nameId);
                                                })))
                                  ]),
                              Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 15),
                                  child: ButtonTheme(
                                      height: 48,
                                      child: RaisedButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0)),
                                        textColor: Colors.white,
                                        color: Colors.blueAccent,
                                        child: Text(
                                          'Back to Main Page',
                                          style: TextStyle(fontSize: 23),
                                        ),
                                        onPressed: () {
                                          backToMainPage(context);
                                        },
                                      )))
                            ],
                          ),
                        ),
                      );
                    } else {
                      print("oh no 1");
                      return Center(child: CircularProgressIndicator());
                    }
                  } else {
                    print("oh no 2");
                    return Center(child: CircularProgressIndicator());
                    //Text("Still loading");
                  }
                })));
  }

  void backToMainPage(BuildContext context) {
    Navigator.pop(context);
  }

  Future navigateToReviewsPage(context, ID, Name) async {
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => new ReviewsPage(id: ID, name: Name)));
  }

  void HopToCafe() {
    visitslist[id - 1] = "1";
    var newvisits = visitslist.join(",");
    databaseReference
        .child('Users/' + currentUser.uid + '/' + 'visits')
        .set(newvisits);
    var hopnumber = userData.value[currentUser.uid]['CafesHopped'];
    hopnumber += 1;
    databaseReference
        .child('Users/' + currentUser.uid + '/' + 'CafesHopped')
        .set(hopnumber);
  }

  getData() async {
    var refs;
    DataSnapshot data = await databaseReference
        .child('Cafes')
        .orderByChild('id')
        .equalTo(id)
        .once();
    /*.then((DataSnapshot snapshot) {
      refs = snapshot.value;
      value = snapshot.value;
      print(value);
    });*/
    currentUser = await FirebaseAuth.instance.currentUser;
    String userid = currentUser.uid;
    userData = await databaseReference.child('Users').once();
    var visits = userData.value[userid]['visits'];
    visitslist = visits.split(',');
    visitflag = visitslist[id - 1];
    print("THE VISITFLAG IS $visitflag");
    var cafeid = 'cafe' + id.toString();
    print(cafeid);
    print(data.value);
    print("im here");
    for (var key in data.value.keys) {
      print(key);
    }
    print(data.value.keys.first);

    refs = data.value;
    value = data.value;
    nameId = data.value.keys.first;
    print(nameId);
    //id = value[cafeid]['id'];
    id = value[cafeid]['id'];
    name = value[cafeid]['name'];
    picture = value[cafeid]['picture'];
    opening_hours = value[cafeid]['hours'];
    rating = value[cafeid]['rating'];
    location = value[cafeid]['location'];
    print('Picture is ' + picture);
    print('name is ' + name);
    print(23);
    return picture;
    //return refs;
  }

  void initState() {
    super.initState();
    id = widget.id;
    //DatabaseReference ref = FirebaseDatabase.instance.reference();
    /*ref.once().then((DataSnapshot snapshot) async {
      print(2234);
      value = snapshot.value;
      print(value);
    });*/
    getData();
  }
}
