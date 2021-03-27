import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Cafe_Bunny/classes/couponClass.dart';
import 'package:Cafe_Bunny/globals.dart' as gb;
import 'globals.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';



class CouponPage extends StatefulWidget {
  static String routeName = "/coupon";
  @override
  _CouponState createState() => _CouponState();
}

class _CouponState extends State<CouponPage> {
  var currentUser;
  var userName;
  var achievements;
  var playerlvl;
  var couponlist;
  var userTitle;
  var userData;
  var cafeHops;
  var inventory;
  List<Coupon> availableCoupons = [Coupon(title: "Coupon 1", code: '1111'), Coupon(title: "Coupon 2", code: '2222'), Coupon(title: "Coupon 3", code: '3333'),  Coupon(title: "Coupon 4", code: '4444')];
  final databaseReference = FirebaseDatabase.instance.reference();
  var kPrimaryLightColor = Color.fromRGBO(
  50, 50, 93, 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Coupons',
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      //drawer: ArgonDrawer(currentPage: "Profile"),
      body: Container(
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot){
            if(snapshot != null){
              if(cafeHops != null && playerlvl != null && couponlist != null ){
                return Stack(children: <Widget>[
                  Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              alignment: Alignment.topCenter,
                              image: AssetImage("images/background2.png"),
                              fit: BoxFit.fitWidth))),
                  SafeArea(
                    child: ListView(children: [
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 16.0, right: 16.0, top: 74.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Stack(children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 7,
                                      offset:
                                      Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Card(
                                    semanticContainer: true,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    elevation: .0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10.0))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 85.0, bottom: 20.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Align(
                                                  child: Text('$userName',
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              50, 50, 93, 1),
                                                          fontSize: 28.0)),
                                                ),
                                                SizedBox(height: 10.0),
                                                Align(
                                                  child: Text('$userTitle',
                                                      style: TextStyle(
                                                        color: Colors.orangeAccent,
                                                        fontSize: 20.0,
                                                        fontWeight: FontWeight.w400,
                                                        fontFamily: 'Lobster',
                                                      )
                                                  ),
                                                ),
                                                SizedBox(height: 30.0),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Text("$achievements",
                                                            style: TextStyle(
                                                                color: Color.fromRGBO(
                                                                    82, 95, 127, 1),
                                                                fontSize: 20.0,
                                                                fontWeight:
                                                                FontWeight.bold)),
                                                        Text("Achievements",
                                                            style: TextStyle(
                                                                color: Color.fromRGBO(
                                                                    50, 50, 93, 1),
                                                                fontSize: 12.0))
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        Text("$playerlvl",
                                                            style: TextStyle(
                                                                color: Color.fromRGBO(
                                                                    82, 95, 127, 1),
                                                                fontSize: 30.0,
                                                                fontWeight:
                                                                FontWeight.bold)),
                                                        Text("Player Level",
                                                            style: TextStyle(
                                                                color: Color.fromRGBO(
                                                                    50, 50, 93, 1),
                                                                fontSize: 12.0))
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        Text("$cafeHops",
                                                            style: TextStyle(
                                                                color: Color.fromRGBO(
                                                                    82, 95, 127, 1),
                                                                fontSize: 20.0,
                                                                fontWeight:
                                                                FontWeight.bold)),
                                                        Text("Cafe Hops",
                                                            style: TextStyle(
                                                                color: Color.fromRGBO(
                                                                    50, 50, 93, 1),
                                                                fontSize: 12.0))
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                Divider(
                                                  height: 40.0,
                                                  thickness: 1.5,
                                                  indent: 32.0,
                                                  endIndent: 32.0,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      right: 25.0, left: 25.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Inventory",
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 13.0,
                                                            color: Color.fromRGBO(94, 114, 228, 1.0)),
                                                      ),
                                                      Text(
                                                        "",
                                                        style: TextStyle(
                                                            color: Color.fromRGBO(94, 114, 228, 1.0),
                                                            fontSize: 13.0,
                                                            fontWeight:
                                                            FontWeight.w600),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 10.0),
                                                SizedBox(
                                                  height: 350,
                                                  width: 400,
                                                  child: ListView.builder(
                                                      itemCount: inventory.length,
                                                      itemBuilder: (context, index) {
                                                        return Card(
                                                          child: ListTile(
                                                            leading: Icon(
                                                              Icons.attach_money_rounded,
                                                              size: 56.0,
                                                              color: kPrimaryLightColor,
                                                            ),
                                                            title: Text(
                                                              inventory[index].title,
                                                              style: TextStyle(
                                                                color: kPrimaryLightColor,
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 20,
                                                              ),
                                                            ),
                                                            onTap: () {},
                                                            trailing: FlatButton(
                                                              onPressed: () {
                                                                setState(() {
                                                                  print('Used coupon code: ${inventory[index].code}');
                                                                  return showDialog<void>(
                                                                    context: context,
                                                                    barrierDismissible: false, // user must tap button!
                                                                    builder: (BuildContext context) {
                                                                      return AlertDialog(
                                                                        title: Text('${inventory[index].title}'),
                                                                        content: SingleChildScrollView(
                                                                          child: ListBody(
                                                                            children: <Widget>[
                                                                              Text('Coupon code: ${inventory[index].code}.'),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        actions: <Widget>[
                                                                          TextButton(
                                                                            child: Text('Back'),
                                                                            onPressed: () {
                                                                              Navigator.of(context).pop();
                                                                              setState(() {

                                                                                inventory.remove(availableCoupons[index]);
                                                                                useCoupon(index);
                                                                              });
                                                                            },
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );
                                                                });
                                                              },
                                                              color: kPrimaryLightColor,
                                                              child: Text(
                                                                'USE',
                                                                style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontWeight: FontWeight.bold,
                                                                  fontSize: 20,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                              FractionalTranslation(
                                  translation: Offset(0.0, -0.5),
                                  child: Align(
                                    child: CircleAvatar(
                                      backgroundImage: avatar(gb.index),
                                      radius: 65.0,
                                      // maxRadius: 200.0,
                                    ),
                                    alignment: FractionalOffset(0.5, 0.0),
                                  )),
                            ]),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ]
                );
              }else {
                return CircularProgressIndicator();
              }
            }else {
              return CircularProgressIndicator();
            }
          },
        )
      )



    );
  }

  void useCoupon(int i){
    couponlist[i] = '0';
    var couponString = couponlist.join(',');
    databaseReference
        .child('Users/' + currentUser.uid + '/' + 'coupons')
        .set(couponString);
  }

  getData() async {
    currentUser = await FirebaseAuth.instance.currentUser;
    String userid = currentUser.uid;
    userData = await databaseReference.child('Users').once();
    cafeHops = userData.value[userid]['CafesHopped'];
    userName = userData.value[userid]['name'];
    userTitle = userData.value[userid]['Title'];
    achievements = userData.value[userid]['achievements'];
    playerlvl = userData.value[userid]['level'];
    couponlist = userData.value[userid]['coupons'].split(',');

    print("meow1:" + userData.value[userid]['coupons']);
    inventory = [];
    if(couponlist[0] == '1'){
      inventory.add(availableCoupons[0]);
    }
    if(couponlist[1] == '1'){
      inventory.add(availableCoupons[1]);
    }if(couponlist[2] == '1'){
      inventory.add(availableCoupons[2]);
    }
    if(couponlist[3] == '1'){
      inventory.add(availableCoupons[3]);
    }

    // for(var i = 0;i < couponlist.length; i++){
    //   if(couponlist[i] == '1'){
    //     print("meow" + couponlist[i]);
    //     inventory.add(availableCoupons[couponlist[i]-1]);
    //   }
    // }
    
    //gb.hopCount = cafeHops;
    //gb.playerLevel = (cafeHops / 2).ceil();
    //gb.hopCount = 0;
    //print("HELLO THERE");
    //print("PLAYER LEVEL IS ${gb.hopCount}");
    //if (gb.hopCount > 0 && gb.playerLevel > 0) {
    if (cafeHops != null && playerlvl != null && couponlist != null && inventory != null) {
      return cafeHops;
    }
    //return cafeHops;
    //}
    //return cafeHops;
  }

}