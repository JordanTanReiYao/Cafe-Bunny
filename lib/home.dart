import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:Cafe_Bunny/place_marker.dart';
import 'package:Cafe_Bunny/detailspage.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:clippy_flutter/triangle.dart';
import 'package:Cafe_Bunny/widgets/sidemenu.dart';

/*void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainMap(),
  ));
}*/

class MainMap extends StatefulWidget {
  @override
  _MainMapState createState() => _MainMapState();
}

class _MainMapState extends State<MainMap> {
  DetailsPage detailsPage;
  var navdraw;
  Widget currentPage;

  CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();
  var currentUser;
  String username;
  final databaseReference = FirebaseDatabase.instance.reference();
  GoogleMapController mapController;
  Set<MyMarker> markersList = new Set();

//
// add the markers to the markersList
  Future<int> _addMarkers() async {
    var places = await getData();
    currentUser = await FirebaseAuth.instance.currentUser;
    String userid = currentUser.uid;
    DataSnapshot userData = await databaseReference.child('Users').once();
    var visits = userData.value[userid]['visits'];
    List visitslist = visits.split(',');
    print("VISITS IS $visitslist");
    print(visitslist.runtimeType);
    for (var i in places.keys) {
      // ignore: omit_local_variable_types
      MyMarker marker = MyMarker(places[i]['name'],
          id: MarkerId(places[i]['id'].toString()),
          lat: places[i]['latitude'],
          lng: places[i]['longitude'],
          icon: visitslist[places[i]['id'] - 1] == '0'
              ? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen)
              : BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          onTap: () {
        var id = places[i]['id'];
        String name = places[i]['name'];
        _customInfoWindowController.addInfoWindow(
          Container(
              width: 300,
              height: 1100,
              child: Center(
                  child: Column(
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.lightBlueAccent),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 6, 9, 1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          /*Expanded(
                                child:*/
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              //width: MediaQuery.of(context).size.width,
                              //margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              children: <Widget>[
                                Container(
                                    margin: const EdgeInsets.all(0),
                                    child: Image.asset(
                                      //'assets/cafefood.png',
                                      'assets/cafe2.png',
                                      width: 28,
                                      height: 28,
                                    )),
                                Container(
                                    child: Expanded(
                                        flex: 2,
                                        child: Text(
                                          '$name',
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: TextStyle(
                                              //color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  18) /*Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                    color: Colors.white,
                                  )*/
                                          ,
                                        )))
                              ])
                          //),
                          ,
                          /*SizedBox(
                              height: 2,
                            ),*/
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              //margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              children: <Widget>[
                                ButtonTheme(
                                    minWidth: 18,
                                    height: 24,
                                    child: RaisedButton(
                                        color: Colors.lightBlueAccent,
                                        child: Text(
                                          'View Details',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        onPressed: () {
                                          navigateToSubPage(context, id);
                                        }))
                              ])
                        ],
                      ),
                    ),
                  ),
                  //),
                  Triangle.isosceles(
                    edge: Edge.BOTTOM,
                    child: Container(
                      color: Colors.lightBlueAccent,
                      width: 20.0,
                      height: 10.0,
                    ),
                  ),
                ],
              ))),
          LatLng(places[i]['latitude'], places[i]['longitude']),
        );

        //print("HEY!!!");
        //navigateToSubPage(context, places[i]['id']);
      }); //null /*(navigateToSubPage(context, 2))*/);
      markersList.add(marker);
      print('yessir');
      print('Markers list is $markersList');
    }
    /*locations.forEach((Map<String, dynamic> location) {
      final MyMarker marker = MyMarker(location['Location_Name'],
          id: MarkerId(location['Location_Number']),
          lat: location['coordinates'][1],
          lng: location['coordinates'][0],
          onTap: null);

      markersList.add(marker);
    });*/
    currentUser = await FirebaseAuth.instance.currentUser;
    //String userid = currentUser.uid;
    //DataSnapshot userData = await databaseReference.child('Users').once();
    //    DataSnapshot userData = await databaseReference.child('Users').orderByChild('uid').equalTo(userid).once();

    //print("here is $data");
    print("user id is $userid");
    //String userid = currentUser.uid;
    print("The user name is " + userData.value[userid]['name']);
    username = userData.value[userid]['name'];
    var useremail = userData.value[userid]['email'];
    navdraw = SideMenu(
      userName: username,
      email: useremail,
    );
    print('nav draw is $navdraw');
    var end = null;
    //print("The user age is" + currentUser.age);
    if (navdraw != null && markersList.isNotEmpty) {
      end = 1;
    }
    return end;
    //return markersList;
  }

  Future navigateToSubPage(context, Id) async {
    print(2345);
    // ignore: unawaited_futures
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => new DetailsPage(id: Id, callback: this.callback)));
  }

  void callback(Widget nextPage) {
    setState(() {
      this.currentPage = nextPage;
    });
  }

  getData() async {
    var refs;
    // ignore: omit_local_variable_types
    DataSnapshot data = await databaseReference.child('Locations').once();
    /*.then((DataSnapshot snapshot) {
      refs = snapshot.value;
      value = snapshot.value;
      print(value);
    });*/
    print(23);
    for (var i in data.value.keys) {
      var latitude = data.value[i]['latitude'];
      print('the latitude is $latitude');
    }
    print('nav draw is $navdraw');

    currentUser = await FirebaseAuth.instance.currentUser;
    String userid = currentUser.uid;
    DataSnapshot userData = await databaseReference.child('Users').once();
    //    DataSnapshot userData = await databaseReference.child('Users').orderByChild('uid').equalTo(userid).once();

    //print("here is $data");
    print("user id is $userid");
    //String userid = currentUser.uid;
    print("The user name is " + userData.value[userid]['name']);
    username = userData.value[userid]['name'];
    navdraw = SideMenu(userName: username);
    print('nav draw is $navdraw');
    var end = null;
    //print("The user age is" + currentUser.age);
    if (navdraw != null && data.value != null) {
      end = 1;
    }
    if (end == 1) {
      return data.value;
    }
    //return data.value;
    //return refs;
  }

  getAll() async {
    var refs;
    // ignore: omit_local_variable_types
    DataSnapshot data = await databaseReference.child('Locations').once();
    /*.then((DataSnapshot snapshot) {
      refs = snapshot.value;
      value = snapshot.value;
      print(value);
    });*/
    print(23);
    for (var i in data.value.keys) {
      var latitude = data.value[i]['latitude'];
      print('the latitude is $latitude');
    }
    print('nav draw is $navdraw');

    currentUser = await FirebaseAuth.instance.currentUser;
    String userid = currentUser.uid;
    DataSnapshot userData = await databaseReference.child('Users').once();
    //    DataSnapshot userData = await databaseReference.child('Users').orderByChild('uid').equalTo(userid).once();

    print("here is $data");
    print("user id is $userid");
    //String userid = currentUser.uid;
    print("The user name is " + userData.value[userid]['name']);
    username = userData.value[userid]['name'];
    navdraw = SideMenu(userName: username);
    print('nav draw is $navdraw');
    var end = null;
    //print("The user age is" + currentUser.age);
    if (navdraw != null && data.value != null) {
      end = 1;
    }
    if (end == 1) {
      return end;
    } else {
      return null;
    }
    //return data.value;
    //return refs;
  }

  void _onMapCreated(GoogleMapController controller) {
    // update map controller
    setState(() {
      mapController = controller;
    });
    // add the markers to the map
    _addMarkers();

    // create bounding box for view

    // adjust camera to boundingBox
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: FutureBuilder(
            future: _addMarkers(),
            builder: (context, snapshot) {
              if (snapshot != null) {
                return navdraw;
              } else {
                return Align(
                    alignment: Alignment.topCenter,
                    child: CircularProgressIndicator());
              }
            }),
        appBar: AppBar(
          title: Text('Cafe Bunny'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
            child: FutureBuilder(
                future: _addMarkers(),
                builder: (context, snapshot) {
                  if (snapshot != null) {
                    if (navdraw != null) {
                      return Stack(
                        children: <Widget>[
                          GoogleMap(
                            onTap: (position) {
                              _customInfoWindowController.hideInfoWindow();
                            },
                            onCameraMove: (position) {
                              _customInfoWindowController.onCameraMove();
                            },
                            onMapCreated:
                                (GoogleMapController controller) async {
                              _customInfoWindowController.googleMapController =
                                  controller;
                            },
                            markers: markersList.toSet(),
                            initialCameraPosition: CameraPosition(
                              target: LatLng(
                                  1.3473582957696049, 103.67988893615487),
                              zoom: 15,
                            ),
                          ),
                          CustomInfoWindow(
                              controller: _customInfoWindowController,
                              height: 110, //95,
                              width: 190,
                              offset: 30 //50,
                              ),
                        ],
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                    /*GoogleMap(
                        initialCameraPosition: CameraPosition(
                            target:
                                LatLng(1.3473582957696049, 103.67988893615487),
                            zoom: 15),
                        onMapCreated: _onMapCreated,
                        myLocationEnabled: true,
                        mapType: MapType.normal,
                        markers: markersList.toSet());
                  */

                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                })));
  }

  void initState() {
    super.initState();
    //DatabaseReference ref = FirebaseDatabase.instance.reference();
    /*ref.once().then((DataSnapshot snapshot) async {
      print(2234);
      value = snapshot.value;
      print(value);
    });*/
    //detailsPage = DetailsPage(this.callback);

    //currentPage = feedPage;
    //SideMenu.initS
    _addMarkers();
    //getData();
  }
}
