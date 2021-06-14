import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proyectouedadas/General/widget_drawer.dart';


class Mapa_Page extends StatefulWidget {
  // Mapa_Page({Key key}) : super(key: key);

  final LatLng fromPoint = LatLng(40.2839, -3.80033);
  final LatLng toPoint = LatLng(40.2839, -3.80033);

  @override
  _Mapa_PageState createState() => _Mapa_PageState();
}

class _Mapa_PageState extends State<Mapa_Page> {
  // Colores
  Color fondo2 = (Color.fromRGBO(192, 255, 186, 1));
  Color verdePOtentorro = Color.fromRGBO(2, 66, 26, 1);
  Color primaryColor = Color.fromRGBO(39, 174, 96 , 1);
  Color logoGreen = Color(0xff25bcbb);
  Color loginInterno = Color.fromRGBO(27, 30, 28, 1);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mapita bonito"),
        backgroundColor: verdePOtentorro,
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: widget.fromPoint,
          zoom: 16,
        ),
        markers: _createMarkers(),
      ),
    );
  }

  Set<Marker> _createMarkers(){
    var tmp = Set<Marker>();

    tmp.add(Marker(
      markerId: MarkerId("fromPoint"),
      position: widget.fromPoint
    ));
    return tmp;
  }
}