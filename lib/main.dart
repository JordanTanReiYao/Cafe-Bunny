import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_maps_in_flutter/place_marker.dart';
import 'package:google_maps_in_flutter/detailspage.dart';

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
  final databaseReference = FirebaseDatabase.instance.reference();
  GoogleMapController mapController;
  Set<MyMarker> markersList = new Set();

  List<Map<String, dynamic>> locations = [
    {
      "Location_Number": "-76.97892538.882767",
      "Location_Name": "John Dean and Hannibal Hamlin Burial Sites",
      "coordinates": [-76.978923660098019, 38.882767398397789]
    },
    {
      "Location_Number": "-77.16515878125193238.938782583950172",
      "Location_Name": "Camp Greene",
      "coordinates": [-77.165158781251932, 38.938782583950172]
    },
    {
      "Location_Number": "-77.04500938.919531",
      "Location_Name": "John Little Farm Site",
      "coordinates": [-77.045009, 38.919531]
    },
  ];

//
// add the markers to the markersList
  Future<Set> _addMarkers() async {
    var places = await getData();
    for (var i in places.keys) {
      MyMarker marker = MyMarker(places[i]['name'],
          id: MarkerId(places[i]['id'].toString()),
          lat: places[i]['latitude'],
          lng: places[i]['longitude'], onTap: () {
        print("HEY!!!");
        navigateToSubPage(context, 3);
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
        appBar: AppBar(
          title: Text('Cafe Bunny'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
            child: FutureBuilder(
                future: _addMarkers(),
                builder: (context, snapshot) {
                  if (snapshot != null) {
                    return GoogleMap(
                        initialCameraPosition: CameraPosition(
                            target:
                                LatLng(1.3473582957696049, 103.67988893615487),
                            zoom: 15),
                        onMapCreated: _onMapCreated,
                        myLocationEnabled: true,
                        mapType: MapType.normal,
                        markers: markersList.toSet());
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
