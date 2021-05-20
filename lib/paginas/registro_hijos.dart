import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyectouedadas/Colores/widget_drawer.dart';

class RegistroHijos extends StatefulWidget {
  RegistroHijos({Key key}) : super(key: key);
  @override
  _RegistroHijosState createState() => _RegistroHijosState();
}

class _RegistroHijosState extends State<RegistroHijos> {
  // Colores
  Color fondo2 = (Color.fromRGBO(192, 255, 186, 1));
  Color verdePOtentorro = Color.fromRGBO(2, 66, 26, 1);
  Color primaryColor = Color.fromRGBO(39, 174, 96 , 1);
  Color logoGreen = Color(0xff25bcbb);
  Color loginInterno = Color.fromRGBO(27, 30, 28, 1);
  String _fecha = "";
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
        backgroundColor: fondo2,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        drawer: menu_lateral(),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: <Widget>[
            Container(
            margin: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                Text(
                  'Añade a tus hijos \npara continuar',
                  textAlign: TextAlign.center,
                  style:
                      GoogleFonts.openSans(color: verdePOtentorro, fontSize: 25),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
            SizedBox(height: 25),
            _crearInput(),  // Input de nombre
            SizedBox(height: 35),
            _crearFecha(context), // Input de fecha
            SizedBox(height: 45),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  _crearDropdown(),  // Primer Dropdown
                  _crearDropdown2()  // Segundo Dropdown
                ],
              ),
            ),
            SizedBox(height: 75),
            _botonSalida(context) // Boton de registro
          ],
        ),
      ),
    );
  }
  
  Widget _crearInput() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        //autofocus: true,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: Colors.deepOrange),
          ),
          labelText: "Nombre",
          labelStyle: TextStyle(color: primaryColor),
          helperText: "Nombre del hijo",
          prefixIcon: Icon(
            Icons.account_circle,
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
      firstDate: new DateTime(2008),
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
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: _controlador,
        enableInteractiveSelection: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          hintText: "Fecha de nacimiento",
          labelText: "Fecha de nacimiento",
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
        child: Text('Añadir Hijo',
            style: TextStyle(color: Colors.white, fontSize: 16)),
            textColor: Colors.white,
      ),
    );
  }
}