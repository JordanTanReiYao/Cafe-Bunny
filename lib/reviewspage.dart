import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
//import 'package:google_maps_in_flutter/review.dart';
import 'package:intl/intl.dart';
import 'package:Cafe_Bunny/review.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ReviewsPage extends StatefulWidget {
  final int id;
  final String name;
  //const DetailsPage(this.id);
  ReviewsPage({Key key, @required this.id, @required this.name})
      : super(key: key);
  Reviews createState() => Reviews();
}

class Reviews extends State<ReviewsPage> {
  DataSnapshot userData;

  int id;
  String userName;
  var currentUser;
  var name;
  var retrieved;
  List<SingleReview> reviewsList = [];
  final _textEditingController = TextEditingController();
  final _textEditingController2 = TextEditingController();
  final databaseReference = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Reviews'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot != null) {
                  if (reviewsList.isNotEmpty) {
                    return Scrollbar(
                        child: ListView.builder(
                            itemCount: reviewsList.length,
                            itemBuilder: (_, index) {
                              return reviewsUI(
                                  reviewsList[index].date,
                                  reviewsList[index].review,
                                  reviewsList[index].username,
                                  reviewsList[index].rating);
                            }));
                  } else {
                    print("oh no 1");
                    return Center(child: CircularProgressIndicator());
                  }
                } else {
                  print("oh no 2");
                  return Center(child: CircularProgressIndicator());
                }
              }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
            AddReviewDialog(context);
          },
          child: const Icon(Icons.add),
          tooltip: 'Add Review',
          backgroundColor: Colors.blue,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            color: Colors.blueAccent,
            child: Container(
              height: 48,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                      iconSize: 45,
                      color: Colors.white,
                      tooltip: "Back to Home",
                      icon: const Icon(
                        Icons.home,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                    )
                  ]),
            )));
  }

  Widget reviewsUI(String date, String review, String username, double rating) {
    return Container(
        alignment: Alignment.center,
        //height: 150,
        child: Card(
            elevation: 10,
            margin: EdgeInsets.all(15),
            child: Center(
                child: Column(children: <Widget>[
              Container(
                  height: 30,
                  color: Colors.blue.shade300,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          username,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 21),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(width: 90),
                        Text(
                          date,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 21),
                          textAlign: TextAlign.center,
                        )
                      ])),
              SizedBox(
                height: 18,
              ),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(children: <Widget>[
                      SizedBox(width: 17),
                      Text(
                        '$rating',
                        style: TextStyle(
                            fontSize: 27, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Image.asset(
                        'assets/ratings star.png',
                        width: 24,
                        height: 24,
                      )
                    ]),
                    SizedBox(width: 10),
                    Container(
                      width: 2,
                      height: 50,
                      color: Colors.black45,
                    ),
                    SizedBox(width: 10),

                    /*Align(
                  child:*/
                    /* ListTile(
                        title:*/
                    Expanded(
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 5, 10),
                            child: Text(
                              review,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 19),
                              textAlign: TextAlign.center,
                            ))),

                    //),
                    // alignment: Alignment.center,
                    //)
                  ]),
              SizedBox(
                height: 18,
              )

              /*Center(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  child: Text(review,
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center))*/
            ]))));
  }

  AddReviewDialog(BuildContext context) async {
    _textEditingController.clear();
    _textEditingController2.clear();
    await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          var height = MediaQuery.of(context).size.height;
          var width = MediaQuery.of(context).size.width;
          return AlertDialog(
            content: SizedBox(
                height: 400,
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Add Review",
                            style: TextStyle(
                                color: Colors.blueAccent, fontSize: 23),
                          ),
                          SizedBox(width: 6),
                          Image.asset(
                            'assets/review3.png',
                            width: 30,
                            height: 30,
                          )
                        ]),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(9, 5, 0, 2),
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Colors.black, // set border color
                              width: 2.0), // set border width
                          borderRadius: BorderRadius.all(Radius.circular(
                              10.0)), // set rounded corner radius
                        ),
                        child: Expanded(
                            child: TextField(
                          controller: _textEditingController,
                          maxLines: 10,
                          autofocus: true,
                          decoration: InputDecoration(
                            /*focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2.0),
                            ),*/
                            border: InputBorder.none,
                            hintText: 'Enter your review here',
                            /*labelText: 'Add Review',
                          labelStyle: TextStyle(
                            fontSize: 24,
                          ),*/
                          ),
                        ))),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.fromLTRB(0, 9, 0, 0),
                              child: Text('Enter rating')),
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                              padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                              child: Container(
                                  height: 50,
                                  width: 70,
                                  child: TextField(
                                    controller: _textEditingController2,
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                    autofocus: true,
                                    decoration: InputDecoration(
                                      isCollapsed: true,
                                      contentPadding: EdgeInsets.all(7),
                                      hintText: 'e.g. 4',
                                      /*labelText: 'Add Review',
                          labelStyle: TextStyle(
                            fontSize: 24,
                          ),*/
                                    ),
                                  ))),
                          Padding(
                              padding: EdgeInsets.fromLTRB(5, 0, 0, 7),
                              child: Image.asset('assets/ratings star.png',
                                  width: 20, height: 20))
                        ]),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          FlatButton(
                              child: const Text(
                                'Add',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.blueAccent),
                              ),
                              onPressed: () {
                                setState(() => addReview(
                                    _textEditingController.text.toString(),
                                    double.parse(_textEditingController2.text
                                        .toString())));
                                Navigator.pop(context);
                              }),
                          FlatButton(
                              child: const Text('Cancel',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.blueAccent)),
                              onPressed: () {
                                Navigator.pop(context);
                              })
                        ])
                  ],
                )),
          );
        });
  }

  getData() async {
    var refs;
    DataSnapshot data =
        await databaseReference.child('Cafes/' + name + '/reviews').once();

    print("YESSIR");

    retrieved = data.value.values;
    print(retrieved);
    reviewsList = [];

    var now = new DateTime.now();
    var formatter = new DateFormat('dd-MM-yyyy');
    var formattedDate = formatter.format(now);
    var keys = data.value.keys;
    var values = data.value;
    for (var i in keys) {
      SingleReview review = new SingleReview(
          values[i]['date'],
          values[i]['review'],
          values[i]['username'],
          values[i]['rating'].toDouble());
      reviewsList.add(review);
    }
    reviewsList.sort((a, b) {
      return DateTime.parse(b.date).compareTo(DateTime.parse(a.date));
    });
    currentUser = await FirebaseAuth.instance.currentUser;
    String userid = currentUser.uid;
    userData = await databaseReference.child('Users').once();
    userName = userData.value[userid]['name'];
    print('The reviews are $reviewsList');
    print('The DATE IS NOW ' + formattedDate); // 2016-01-25
    return retrieved;
  }

  addReview(String review_statement, double rating) {
    if (review_statement.length > 0) {
      var now = DateTime.now();
      var formatter = DateFormat('yyyy-MM-dd');
      var formatted = formatter.format(now);
      var review = SingleReview(
          formatted, review_statement.toString(), this.userName, rating);
      databaseReference
          .child('Cafes/' + name + '/reviews')
          .push()
          .set(review.toJson());
    }
    var reviewsgiven = userData.value[currentUser.uid]['ReviewsGiven'];
    reviewsgiven += 1;
    databaseReference
        .child('Users/' + currentUser.uid + '/' + 'ReviewsGiven')
        .set(reviewsgiven);
  }

  void initState() {
    super.initState();
    id = widget.id;
    name = widget.name;
    //DatabaseReference ref = FirebaseDatabase.instance.reference();
    /*ref.once().then((DataSnapshot snapshot) async {
      print(2234);
      value = snapshot.value;
      print(value);
    });*/
    print(33445);
    getData();
  }
}
