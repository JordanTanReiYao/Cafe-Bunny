import 'package:flutter/material.dart';
import 'package:Cafe_Bunny/globals.dart' as gb;
import 'package:Cafe_Bunny/couponClass.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class Achievement2 extends StatefulWidget {
  //static String routeName = "/achievement2";
  @override
  _Achievement2State createState() => _Achievement2State();
}

class _Achievement2State extends State<Achievement2> {
  var currentUser;
  var userName;
  var playerlvl;
  var userTitle;
  var userData;
  var cafeHops;
  final databaseReference = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            'Achievements',
            /*style: TextStyle(
            //color: Color(0xff118203d),
            //fontWeight: FontWeight.bold,
            fontSize: 20,
          ),*/
          ),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        //backgroundColor: Colors.white,
        //drawer: ArgonDrawer(currentPage: "Profile"),
        body: Container(
            child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot != null) {
              return Stack(children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            alignment: Alignment.topCenter,
                            image: AssetImage("assets/background2.png"),
                            fit: BoxFit.fitWidth))),
                SafeArea(
                  child: ListView(children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16.0, top: 74.0),
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
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Card(
                                  semanticContainer: true,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  elevation: .0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 85.0, bottom: 20.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  FlatButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        gb.hopCount += 1;
                                                        if (gb.expFlag == 0)
                                                          gb.expFlag += 1;
                                                        else {
                                                          gb.expFlag = 0;
                                                          gb.playerLevel += 1;
                                                        }
                                                      });
                                                    },
                                                    color: Color.fromRGBO(
                                                        17, 205, 239, 1.0),
                                                    child: Text(
                                                      '+ HOP',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 30.0,
                                                  ),
                                                  FlatButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        gb.hopCount = 0;
                                                        gb.playerLevel = 1;
                                                        gb.hopCount = 0;
                                                        gb.expFlag = 0;
                                                      });
                                                    },
                                                    color: Color.fromRGBO(
                                                        23, 43, 77, 1.0),
                                                    child: Text(
                                                      '! HOP',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 30.0),
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
                                                        color: Color.fromRGBO(
                                                            50, 50, 93, 1),
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                              ),
                                              SizedBox(height: 30.0),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Text("${gb.expFlag}/2",
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      82,
                                                                      95,
                                                                      127,
                                                                      1),
                                                              fontSize: 20.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      Text("Experience",
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      50,
                                                                      50,
                                                                      93,
                                                                      1),
                                                              fontSize: 12.0))
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      Text("$playerlvl",
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      82,
                                                                      95,
                                                                      127,
                                                                      1),
                                                              fontSize: 30.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      Text("Player Level",
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      50,
                                                                      50,
                                                                      93,
                                                                      1),
                                                              fontSize: 12.0))
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      Text("$cafeHops",
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      82,
                                                                      95,
                                                                      127,
                                                                      1),
                                                              fontSize: 20.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      Text("Cafe Hops",
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      50,
                                                                      50,
                                                                      93,
                                                                      1),
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
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Achievement",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 13.0,
                                                          color: Color.fromRGBO(
                                                              94,
                                                              114,
                                                              228,
                                                              1.0)),
                                                    ),
                                                    Text(
                                                      "Status",
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              94,
                                                              114,
                                                              228,
                                                              1.0),
                                                          fontSize: 13.0,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 10.0),
                                              SizedBox(
                                                height: 400,
                                                width: 400,
                                                child: ListTileTheme(
                                                  selectedTileColor:
                                                      Colors.blue,
                                                  child: ListView(
                                                    children: <Widget>[
                                                      Card(
                                                        child: ListTile(
                                                          leading: Icon(
                                                            Icons.auto_awesome,
                                                            size: 56.0,
                                                            color: Color(
                                                                0xff232c51),
                                                          ),
                                                          title: Text(
                                                              '"Baby Bunny"'),
                                                          subtitle: Text(
                                                              'Hop 3 times'),
                                                          onTap: () {
                                                            print('Baby Bunny');
                                                          },
                                                          enabled: checkHop(3),
                                                          trailing: !checkHop(3)
                                                              ? Text(
                                                                  '${gb.hopCount}/3',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize:
                                                                        20,
                                                                  ),
                                                                )
                                                              : !gb.babybunny
                                                                  ? FlatButton(
                                                                      onPressed:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          // Critical code
                                                                          gb.babybunny =
                                                                              true;
                                                                          print(
                                                                              '"Baby Bunny" claimed');
                                                                        });
                                                                      },
                                                                      color: Color(
                                                                          0xff232c51),
                                                                      child:
                                                                          Text(
                                                                        'CLAIM',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.white,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          fontSize:
                                                                              20,
                                                                        ),
                                                                      ),
                                                                    )
                                                                  : Text(
                                                                      'CLAIMED',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Color(
                                                                            0xff232c51),
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontSize:
                                                                            20,
                                                                      ),
                                                                    ),
                                                        ),
                                                      ),
                                                      Card(
                                                        child: ListTile(
                                                          leading: Icon(
                                                            Icons
                                                                .attach_money_rounded,
                                                            size: 56.0,
                                                            color: Color(
                                                                0xff232c51),
                                                          ),
                                                          title:
                                                              Text('Coupon 1'),
                                                          subtitle: Text(
                                                              'Reach Player Level 2'),
                                                          onTap: () {
                                                            print('Coupon 1');
                                                          },
                                                          enabled: checkLvl(2),
                                                          trailing: !checkLvl(2)
                                                              ? Text(
                                                                  '${gb.playerLevel}/5',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize:
                                                                        20,
                                                                  ),
                                                                )
                                                              : !gb.coupon1
                                                                  ? FlatButton(
                                                                      onPressed:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          // Critical code
                                                                          gb.coupon1 =
                                                                              true;
                                                                          print(
                                                                              'Coupon 1 claimed');
                                                                          gb.inventory.add(Coupon(
                                                                              title: 'Coupon 1',
                                                                              code: '1111'));
                                                                        });
                                                                      },
                                                                      color: Color(
                                                                          0xff232c51),
                                                                      child:
                                                                          Text(
                                                                        'CLAIM',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.white,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          fontSize:
                                                                              20,
                                                                        ),
                                                                      ),
                                                                    )
                                                                  : Text(
                                                                      'CLAIMED',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Color(
                                                                            0xff232c51),
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontSize:
                                                                            20,
                                                                      ),
                                                                    ),
                                                        ),
                                                      ),
                                                      Card(
                                                        child: ListTile(
                                                          leading: Icon(
                                                            Icons
                                                                .attach_money_rounded,
                                                            size: 56.0,
                                                            color: Color(
                                                                0xff232c51),
                                                          ),
                                                          title:
                                                              Text('Coupon 2'),
                                                          subtitle: Text(
                                                              'Reach Player Level 10'),
                                                          onTap: () {
                                                            print('Coupon 2');
                                                          },
                                                          enabled: checkLvl(10),
                                                          trailing: !checkLvl(
                                                                  10)
                                                              ? Text(
                                                                  '${gb.playerLevel}/10',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize:
                                                                        20,
                                                                  ),
                                                                )
                                                              : !gb.coupon2
                                                                  ? FlatButton(
                                                                      onPressed:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          // Critical code
                                                                          gb.coupon2 =
                                                                              true;
                                                                          print(
                                                                              'Coupon 2 claimed');
                                                                          gb.inventory.add(Coupon(
                                                                              title: 'Coupon 2',
                                                                              code: '2222'));
                                                                        });
                                                                      },
                                                                      color: Color(
                                                                          0xff232c51),
                                                                      child:
                                                                          Text(
                                                                        'CLAIM',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.white,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          fontSize:
                                                                              20,
                                                                        ),
                                                                      ),
                                                                    )
                                                                  : Text(
                                                                      'CLAIMED',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Color(
                                                                            0xff232c51),
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontSize:
                                                                            20,
                                                                      ),
                                                                    ),
                                                        ),
                                                      ),
                                                      Card(
                                                        child: ListTile(
                                                          leading: Icon(
                                                            Icons.auto_awesome,
                                                            size: 56.0,
                                                            color: Color(
                                                                0xff232c51),
                                                          ),
                                                          title: Text(
                                                              '"Buffet Bunny"'),
                                                          subtitle: Text(
                                                              'Hop 10 times'),
                                                          onTap: () {
                                                            print(
                                                                'Buffet Bunny');
                                                          },
                                                          enabled: checkHop(10),
                                                          trailing: !checkHop(
                                                                  10)
                                                              ? Text(
                                                                  '${gb.hopCount}/10',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize:
                                                                        20,
                                                                  ),
                                                                )
                                                              : !gb.buffetbunny
                                                                  ? FlatButton(
                                                                      onPressed:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          // Critical code
                                                                          gb.buffetbunny =
                                                                              true;
                                                                          print(
                                                                              '"Buffet bunny" claimed');
                                                                        });
                                                                      },
                                                                      color: Color(
                                                                          0xff232c51),
                                                                      child:
                                                                          Text(
                                                                        'CLAIM',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.white,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          fontSize:
                                                                              20,
                                                                        ),
                                                                      ),
                                                                    )
                                                                  : Text(
                                                                      'CLAIMED',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Color(
                                                                            0xff232c51),
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontSize:
                                                                            20,
                                                                      ),
                                                                    ),
                                                        ),
                                                      ),
                                                      Card(
                                                        child: ListTile(
                                                          leading: Icon(
                                                            Icons
                                                                .attach_money_rounded,
                                                            size: 56.0,
                                                            color: Color(
                                                                0xff232c51),
                                                          ),
                                                          title:
                                                              Text('Coupon 3'),
                                                          subtitle: Text(
                                                              'Reach Player Level 15'),
                                                          onTap: () {
                                                            print('Coupon 3');
                                                          },
                                                          enabled: checkLvl(15),
                                                          trailing: !checkLvl(
                                                                  15)
                                                              ? Text(
                                                                  '${gb.playerLevel}/15',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize:
                                                                        20,
                                                                  ),
                                                                )
                                                              : !gb.coupon3
                                                                  ? FlatButton(
                                                                      onPressed:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          // Critical code
                                                                          gb.coupon3 =
                                                                              true;
                                                                          print(
                                                                              'Coupon 3 claimed');
                                                                          gb.inventory.add(Coupon(
                                                                              title: 'Coupon 3',
                                                                              code: '3333'));
                                                                        });
                                                                      },
                                                                      color: Color(
                                                                          0xff232c51),
                                                                      child:
                                                                          Text(
                                                                        'CLAIM',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.white,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          fontSize:
                                                                              20,
                                                                        ),
                                                                      ),
                                                                    )
                                                                  : Text(
                                                                      'CLAIMED',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Color(
                                                                            0xff232c51),
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontSize:
                                                                            20,
                                                                      ),
                                                                    ),
                                                        ),
                                                      ),
                                                      Card(
                                                        child: ListTile(
                                                          leading: Icon(
                                                            Icons
                                                                .attach_money_rounded,
                                                            size: 56.0,
                                                            color: Color(
                                                                0xff232c51),
                                                          ),
                                                          title:
                                                              Text('Coupon 4'),
                                                          subtitle: Text(
                                                              'Reach Player Level 20'),
                                                          onTap: () {
                                                            print('Coupon 4');
                                                          },
                                                          enabled: checkLvl(20),
                                                          trailing: !checkLvl(
                                                                  20)
                                                              ? Text(
                                                                  '${gb.playerLevel}/20',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize:
                                                                        20,
                                                                  ),
                                                                )
                                                              : !gb.coupon4
                                                                  ? FlatButton(
                                                                      onPressed:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          // Critical code
                                                                          gb.coupon4 =
                                                                              true;
                                                                          print(
                                                                              'Coupon 4 claimed');
                                                                          gb.inventory.add(Coupon(
                                                                              title: 'Coupon 4',
                                                                              code: '4444'));
                                                                        });
                                                                      },
                                                                      color: Color(
                                                                          0xff232c51),
                                                                      child:
                                                                          Text(
                                                                        'CLAIM',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.white,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          fontSize:
                                                                              20,
                                                                        ),
                                                                      ),
                                                                    )
                                                                  : Text(
                                                                      'CLAIMED',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Color(
                                                                            0xff232c51),
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontSize:
                                                                            20,
                                                                      ),
                                                                    ),
                                                        ),
                                                      ),
                                                      Card(
                                                        child: ListTile(
                                                          leading: Icon(
                                                            Icons.auto_awesome,
                                                            size: 56.0,
                                                            color: Color(
                                                                0xff232c51),
                                                          ),
                                                          title: Text(
                                                              '"Super Bunny"'),
                                                          subtitle: Text(
                                                              'Hop 20 times'),
                                                          onTap: () {
                                                            print(
                                                                'Super Bunny');
                                                          },
                                                          enabled: checkHop(20),
                                                          trailing: !checkHop(
                                                                  20)
                                                              ? Text(
                                                                  '${gb.hopCount}/20',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize:
                                                                        20,
                                                                  ),
                                                                )
                                                              : !gb.superbunny
                                                                  ? FlatButton(
                                                                      onPressed:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          // Critical code
                                                                          gb.superbunny =
                                                                              true;
                                                                          print(
                                                                              '"Super bunny" claimed');
                                                                        });
                                                                      },
                                                                      color: Color(
                                                                          0xff232c51),
                                                                      child:
                                                                          Text(
                                                                        'CLAIM',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.white,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          fontSize:
                                                                              20,
                                                                        ),
                                                                      ),
                                                                    )
                                                                  : Text(
                                                                      'CLAIMED',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Color(
                                                                            0xff232c51),
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontSize:
                                                                            20,
                                                                      ),
                                                                    ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
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
                                    backgroundImage: AssetImage(
                                        "assets/sampleprofilepic.png"),
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
              ]);
            } else {
              return CircularProgressIndicator();
            }
          },
          /*bottomNavigationBar:
          CustomBottomNavBar(selectedMenu: MenuState.achievements),*/
        )));
  }

  bool checkLvl(var level) {
    if (playerlvl >= level)
      return true;
    else
      return false;
  }

  bool checkHop(var hop) {
    if (cafeHops >= hop)
      return true;
    else
      return false;
  }

  getData() async {
    currentUser = await FirebaseAuth.instance.currentUser;
    String userid = currentUser.uid;
    userData = await databaseReference.child('Users').once();
    cafeHops = userData.value[userid]['CafesHopped'];
    userName = userData.value[userid]['name'];
    userTitle = userData.value[userid]['Title'];
    playerlvl = (cafeHops / 2).ceil();
    //gb.hopCount = cafeHops;
    //gb.playerLevel = (cafeHops / 2).ceil();
    //gb.hopCount = 0;
    //print("HELLO THERE");
    //print("PLAYER LEVEL IS ${gb.hopCount}");
    //if (gb.hopCount > 0 && gb.playerLevel > 0) {
    if (cafeHops > 0 && playerlvl > 0) {
      return cafeHops;
    }
    //return cafeHops;
    //}
    //return cafeHops;
  }
}
