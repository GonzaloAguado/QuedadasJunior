import 'package:flutter/material.dart';
import 'package:proyectouedadas/General/widget_drawer.dart';


class Favoritos_Page extends StatefulWidget {
  Favoritos_Page({Key key}) : super(key: key);

  @override
  _Favoritos_PageState createState() => _Favoritos_PageState();
}

class _Favoritos_PageState extends State<Favoritos_Page> {
  //COlores
  Color fondo2 = (Color.fromRGBO(192, 255, 186, 1));
  Color verdePOtentorro = Color.fromRGBO(2, 66, 26, 1);
  Color primaryColor = Color.fromRGBO(39, 174, 96 , 1);
  Color logoGreen = Color(0xff25bcbb);
  Color loginInterno = Color.fromRGBO(27, 30, 28, 1);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: fondo2,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        drawer: Menu_lateral(),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}
