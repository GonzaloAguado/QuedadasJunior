
import 'package:flutter/material.dart';
import 'package:proyectouedadas/Colores/widget_drawer.dart';


class RegistroHijos extends StatefulWidget {
  RegistroHijos({Key key}) : super(key: key);

  @override
  _RegistroHijosState createState() => _RegistroHijosState();
}

class _RegistroHijosState extends State<RegistroHijos> {

  Color primaryColor = Color.fromRGBO(115, 198, 182, 72 );
  Color secondaryColor = Color(0xff232c51);
  Color logoGreen = Color(0xff25bcbb);    

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        drawer: menu_lateral(),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: <Widget>[
            _crearInput(),
            Divider(),
            _crearEmail(),
            _crearPassword(),
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
          //border: OutlineInputBorder(
            //borderRadius: BorderRadius.circular(45.0),
          //),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple),
          ),

          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple),
          ),
          labelText: "Usuario",
          helperText: "Solo es el nombre",
          prefixIcon: Icon(
            Icons.account_circle,
            color: Colors.deepPurple,
          ),
        ),
        onChanged: (valor) {
          setState(() {});
        },
      ),
    );
  }

  Widget _crearEmail() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 50.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35.0),
          ),
          labelText: "Correo",
          prefixIcon: Icon(Icons.email),
        ),
        onChanged: (valor) => setState(() {})
      ),
    );
  }

  Widget _crearPassword() {
    return Container(
      padding :EdgeInsets.symmetric(horizontal: 15.0,),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35.0),
          ),
          labelText: "Contraseña",
          prefixIcon: Icon(Icons.lock),
        ),

        onChanged: (valor) => setState(() {
        })
      ),
    );
  }
}