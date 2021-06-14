import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proyectouedadas/General/widget_drawer.dart';

import 'google_map.dart';


class Crear_Quedadas extends StatefulWidget {
  
  final LatLng fromPoint = LatLng(40.2839, -3.80033);
  final LatLng toPoint = LatLng(40.2839, -3.80033);

  @override
  _Crear_QuedadasState createState() => _Crear_QuedadasState();
}

class _Crear_QuedadasState extends State<Crear_Quedadas> {
  // Colores
  Color fondo2 = (Color.fromRGBO(192, 255, 186, 1));
  Color verdePOtentorro = Color.fromRGBO(2, 66, 26, 1);
  Color primaryColor = Color.fromRGBO(39, 174, 96 , 1);
  Color logoGreen = Color(0xff25bcbb);
  Color loginInterno = Color.fromRGBO(27, 30, 28, 1);
  String _fecha = "";
  bool _bcheck = false;
  // Opcion ya seleccionada
  String _opSelecc = "Futbol";
  String _opSelecc2 = "Canicas";
  // Listas de seleccion para los dropdowns
  List <String> _gustos = ["Futbol","Ping Pong","Correr","VoleyBall","Pilla Pilla","Escondite"];
  List <String> _hobbie = ["Canicas","Bakugan","Manga","Deporte"];
  TextEditingController _controlador = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: verdePOtentorro,
          elevation: 0,
        ),
        drawer: Menu_lateral(),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: <Widget>[
          SizedBox(height: 25),
          Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: verdePOtentorro,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                    offset: Offset(2.0,10.0)
                )
              ]
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: 5),
                Text(
                  'Quedada',
                  textAlign: TextAlign.center,
                  style:
                    GoogleFonts.openSans(color: Colors.white, fontSize: 25),
                ),
                SizedBox(height: 10),
                ],
              ),
            ),
          ),
          SizedBox(height: 55),
          _crearFecha(context),
          SizedBox(height: 25),
          _crearHoras(), 
          SizedBox(height: 25),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 128.0),
            child: MaterialButton(
              elevation: 0,
              minWidth: double.maxFinite,
              height: 50,
              onPressed: () async {
                Navigator.push(context, MaterialPageRoute(builder: (_) => Mapa_Page()));           
              },
              color: Colors.deepOrange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(FontAwesomeIcons.mapMarkerAlt),
                  SizedBox(width: 10),
                  Text('Maps',
                    style: TextStyle(color: Colors.white, fontSize: 16)),
                ],
              ),
              textColor: Colors.white,
            ),
          ),
          SizedBox(height: 15),
          _crearSwitch(),
          SizedBox(height: 15),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 110),
            child: Row(
              children: [
                _crearDropdown(), 
              ],
            ),
          ),
          SizedBox(height: 55),
          _botonSalida(context) // Boton de registro
          ],
        ),
      ),
    );
  }

  Widget _crearHoras() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 85.0),
      child: TextField(
        //autofocus: true,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: Colors.deepOrange),
          ),
          labelText: "Hora Quedada",
          labelStyle: TextStyle(color: primaryColor),
          helperText: "Hora quedada exacta hora/min",
          prefixIcon: Icon(
            Icons.timer,
            color: verdePOtentorro,
          ),
        ),
        onChanged: (valor) {
          setState(() {});
        },
      ),
    );
  }

  List<DropdownMenuItem<String>> listaopciones (){
    List <DropdownMenuItem<String>> lista = new List();
    _gustos.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });
    return lista;
  }

  List<DropdownMenuItem<String>> hobbies (){
    List <DropdownMenuItem<String>> lista = new List();
    _hobbie.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });
    return lista;
  }

  // Metodo de drowdown
  Widget _crearDropdown () {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.event_available_rounded,
        color: verdePOtentorro,),
        SizedBox(width: 30.0),
        DropdownButton(
          value: _opSelecc,
          items: listaopciones(),
          onChanged: (opt) {
            setState(() {
              _opSelecc = opt;
            });
          },
        ),
      ],
    ); 
  }

  // Metodo de drowdown de hobbies
  Widget _crearDropdown2 () {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Icon(Icons.sports_esports_outlined,
        color: verdePOtentorro,),
        SizedBox(width: 30.0),
        DropdownButton(
          value: _opSelecc2,
          items: hobbies(),
          onChanged: (opt) {
            setState(() {
              _opSelecc2 = opt;
            });
          },
        ),
      ],
    ); 
  }

  // Metodo que selecciona la fecha
  _selectDate(BuildContext context) async{
    DateTime piqueado = await showDatePicker(
      context: context,
      initialDate:  new DateTime.now(),
      firstDate: new DateTime(2021),
      lastDate: new DateTime(2025),
      locale: Locale("es","ES")
    );
    if (piqueado != null){
      setState(() {
        _fecha = piqueado.toString();
        _controlador.text = _fecha;
      });
    }
  }

  // Metodo que crea el wiget de fecha
  Widget _crearFecha(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 68.0),
      child: TextField(
        controller: _controlador,
        enableInteractiveSelection: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          hintText: "Fecha Quedada",
          labelText: "Fecha Quedada",
          suffixIcon: Icon(Icons.add_circle_outline,
          color: verdePOtentorro),
          prefixIcon: Icon(Icons.calendar_today_outlined,
          color: verdePOtentorro),
          labelStyle: TextStyle(color: primaryColor),
        ),
        onTap: (){
          FocusScope.of(context).requestFocus(new FocusNode());
          _selectDate(context);
        },
      ),
    );
  }

  // Metodo del Boton de registro
  Widget _botonSalida(BuildContext context){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 65.0),
      child: MaterialButton(
        elevation: 0,
        minWidth: double.maxFinite,
        height: 50,
        onPressed: () async {},
        color: verdePOtentorro,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          // side: BorderSide(color: Colors.red)
        ),
        child: Text('Crear Quedada',
            style: TextStyle(color: Colors.white, fontSize: 16)),
            textColor: Colors.white,
        
      ),
    );
  }

  
  Widget _crearSwitch() {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 95.0),
      child: SwitchListTile(
        title: Text("Merienda"),
        value: _bcheck, 
        onChanged: (valor) {
          setState(() {
            _bcheck = valor;
          });   
        },
      ),
    );
  }
}