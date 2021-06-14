import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyectouedadas/General/widget_drawer.dart';
import 'package:proyectouedadas/objetos/Hijos.dart';
import 'package:proyectouedadas/paginas/registro.dart';

class RegistroHijos extends StatefulWidget {
  // RegistroHijos({Key key}) : super(key: key);
  final Hijo hijo;
  RegistroHijos(this.hijo);

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
  bool _bcheck = false;
  bool _bcheck2 = false;

  // Opcion ya seleccionada
  String _opSelecc = "Futbol";
  String _opSelecc2 = "Canicas";

  // Listas de seleccion para los dropdowns
  List <String> _gustos = ["Futbol","Ping Pong","Correr","VoleyBall","Pilla Pilla","Escondite"];
  List <String> _hobbie = ["Canicas","Bakugan","Manga","Deporte"];
  
  // Controladores  de texto
  List<Hijo> items;
  TextEditingController _nombrePadre;
  TextEditingController _nombreHijo;
  TextEditingController _fechaN;
  TextEditingController _genero;
  TextEditingController _gusto;
  TextEditingController _hobbies;
  TextEditingController _controlador = new TextEditingController();

  @override
  void initState() { 
    _nombrePadre = TextEditingController(text: widget.hijo.nombrePadre);
    _nombreHijo = TextEditingController(text: widget.hijo.nombreHijo);
    _fechaN = TextEditingController(text: widget.hijo.nombrePadre.toString());
    _genero = TextEditingController(text: widget.hijo.genero);
    _gusto = TextEditingController(text: widget.hijo.gusto);
    _hobbies = TextEditingController(text: widget.hijo.hobbie);
    super.initState();
  }

  @override
  void dispose() {
    _nombrePadre.dispose();
    _nombreHijo.dispose();
    _fechaN.dispose();
    _genero.dispose();
    _gusto.dispose();
    _hobbies.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: verdePOtentorro,
          elevation: 0,
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 20.0),
              child: CircleAvatar(
                child: Text ("G"),
                backgroundColor: Colors.white,
              ),
            ),
          ],
        ),
        drawer: Menu_lateral(),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: <Widget>[
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
                    'Añade a tus hijos/as \npara continuar',
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
            _crearInput(),  // Input de nombre
            SizedBox(height: 35),
            _crearFecha(context), // Input de fecha
            SizedBox(height: 25),
            _crearChB(),
            _crearChB2(),
            SizedBox(height: 45),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  _crearDropdown(),  // Primer Dropdown
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 18),
                    child: _crearDropdown2()
                  )  // Segundo Dropdown
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
        child: Text('Añadir Hijo/a',
            style: TextStyle(color: Colors.white, fontSize: 16)),
            textColor: Colors.white,
      ),
    );
  }

  Widget _crearChB() {
    return CheckboxListTile(
      title: Text("Niño"),
      value: _bcheck, 
      onChanged: (valor) {
        setState(() {
          _bcheck = valor;
        });   
      },
    );
  }

  Widget _crearChB2() {
    return CheckboxListTile(
      title: Text("Niña"),
      value: _bcheck2, 
      onChanged: (valor) {
        setState(() {
          _bcheck2 = valor;
        });   
      },
    );
  }

}