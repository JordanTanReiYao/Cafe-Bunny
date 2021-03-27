import 'package:Cafe_Bunny/home.dart';
import 'package:clippy_flutter/arc.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

//import 'package:google_maps_in_flutter/review.dart';

class CouponPage extends StatefulWidget {
  //final int id;
  //final String name;
  //const DetailsPage(this.id);
  /*ReviewsPage({Key key, @required this.id, @required this.name})
      : super(key: key);*/
  Coupon createState() => Coupon();
}

class Coupon extends State<CouponPage> {
  int id;
  var name;
  var cafeshopped;
  var reviewsgiven;
  var title;
  final databaseReference = FirebaseDatabase.instance.reference();

  //List<SingleReview> reviewsList = [];
  //final _textEditingController = TextEditingController();
  //final databaseReference = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Coupon QR Code'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
            child: Center(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: Text(
                  "Congrats Bunny!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 37,
                      color: Colors.blueGrey),
                  textAlign: TextAlign.center,
                )),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 35, 0, 20),
                child: Text(
                  "Present this QR code to staff for discount",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                )),
            Image.asset(
              'assets/qrcode.png',
              height: 360,
              width: 360,
            )
          ],
        ))));
  }
}
