import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:Cafe_Bunny/detailspage.dart';

//
// extending the google map marker to add more information
// to it
class MyMarker extends Marker {
  final String name;

  MyMarker(this.name, {MarkerId id, double lat, double lng, icon, onTap})
      : super(
            markerId: id,
            position: LatLng(
              lat,
              lng,
            ),
            icon: icon,
            //infoWindow: InfoWindow()
            //InfoWindow(title: name, onTap: onTap, snippet: name),
            onTap: onTap);

  Future navigateToSubPage(context, Id) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => new DetailsPage(id: Id)));
  }
}
