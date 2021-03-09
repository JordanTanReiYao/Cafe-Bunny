import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_in_flutter/detailspage.dart';

//
// extending the google map marker to add more information
// to it
class MyMarker extends Marker {
  final String name;

  MyMarker(this.name, {MarkerId id, lat, lng, onTap})
      : super(
          markerId: id,
          position: LatLng(
            lat,
            lng,
          ),
          infoWindow: InfoWindow(title: name, onTap: onTap),
        );

  Future navigateToSubPage(context, Id) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => new DetailsPage(id: Id)));
  }
}
