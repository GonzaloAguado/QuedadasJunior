import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class Mapa_Page extends StatefulWidget {
  Mapa_Page({Key key}) : super(key: key);

  @override
  _Mapa_PageState createState() => _Mapa_PageState();
}

class _Mapa_PageState extends State<Mapa_Page> {
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(0, 0),
        zoom: 12,
      ),
    );
  }
}