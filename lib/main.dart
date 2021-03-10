import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_maps_in_flutter/place_marker.dart';
import 'package:google_maps_in_flutter/detailspage.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:clippy_flutter/triangle.dart';
import 'package:google_maps_in_flutter/widgets/sidemenu.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainMap(),
  ));
}

class MainMap extends StatefulWidget {
  @override
  _MainMapState createState() => _MainMapState();
}

class _MainMapState extends State<MainMap> {
  CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  final databaseReference = FirebaseDatabase.instance.reference();
  GoogleMapController mapController;
  Set<MyMarker> markersList = new Set();

//
// add the markers to the markersList
  Future<Set> _addMarkers() async {
    var places = await getData();
    for (var i in places.keys) {
      MyMarker marker = MyMarker(places[i]['name'],
          id: MarkerId(places[i]['id'].toString()),
          lat: places[i]['latitude'],
          lng: places[i]['longitude'],
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          onTap: () {
        var id = places[i]['id'];
        String name = places[i]['name'];
        _customInfoWindowController.addInfoWindow(
          Container(
              width: 300,
              height: 1100,
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
              )),
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
    return markersList;
  }

  Future navigateToSubPage(context, Id) async {
    print(2345);
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => new DetailsPage(id: Id)));
  }

  getData() async {
    var refs;
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
    return data.value;
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
        drawer: NavDrawer(),
        appBar: AppBar(
          title: Text('Cafe Bunny'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
            child: FutureBuilder(
                future: _addMarkers(),
                builder: (context, snapshot) {
                  if (snapshot != null) {
                    return Stack(
                      children: <Widget>[
                        GoogleMap(
                          onTap: (position) {
                            _customInfoWindowController.hideInfoWindow();
                          },
                          onCameraMove: (position) {
                            _customInfoWindowController.onCameraMove();
                          },
                          onMapCreated: (GoogleMapController controller) async {
                            _customInfoWindowController.googleMapController =
                                controller;
                          },
                          markers: markersList.toSet(),
                          initialCameraPosition: CameraPosition(
                            target:
                                LatLng(1.3473582957696049, 103.67988893615487),
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
                    return CircularProgressIndicator();
                  }
                  ;
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
    _addMarkers();
    //getData();
  }
}
