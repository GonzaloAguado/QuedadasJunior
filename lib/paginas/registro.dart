import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Registro extends StatefulWidget {
  Registro({Key key}) : super(key: key);

  @override
  _RegistroState createState() => _RegistroState();
}


class _RegistroState extends State<Registro> {
  // Colores
  Color primaryColor = (Color.fromRGBO(2, 66, 26,1));
  Color secondaryColor = Color.fromRGBO(39, 174, 96 , 1);
  Color logoGreen = Color(0xff25bcbb);
  Color loginInterno = Color.fromRGBO(27, 30, 28, 1);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                Text(
                  'Registrate en \nQuedadas Junior',
                  textAlign: TextAlign.center,
                  style:
                      GoogleFonts.openSans(color: Colors.white, fontSize: 28),
                ),
                SizedBox(height: 20),
                Text(
                  '',
                  textAlign: TextAlign.center,
                  style:
                      GoogleFonts.openSans(color: Colors.white, fontSize: 14),
                ),
                SizedBox(
                  height: 50,
                ),
                _crearCorreo(),
                SizedBox(height: 20),
                _crearContra(),
                SizedBox(height: 50),
                _botonRegistro(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _crearCorreo() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: TextField(
        //autofocus: true,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: Colors.deepOrange),
          ),
          labelText: "Email",
          labelStyle: TextStyle(color: Colors.white),
          helperText: "Correo ya sea google o lo que sea",
          prefixIcon: Icon(
            Icons.account_circle,
            color: secondaryColor,
          ),
        ),
        onChanged: (valor) {
          setState(() {});
        },
      ),
    );
  }

  Widget _crearContra() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: TextField(
        //autofocus: true,
        obscureText: true,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: Colors.deepOrange),
          ),
          labelText: "Contraseña",
          labelStyle: TextStyle(color: Colors.white),
          helperText: "Contraseña minimo 5 caracteres",
          prefixIcon: Icon(
            Icons.lock,
            color: secondaryColor,
          ),
        ),
        onChanged: (valor) {
          setState(() {});
        },
      ),
    );
  }

  // Metodo del Boton de registro
  Widget _botonRegistro(BuildContext context){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: MaterialButton(
        elevation: 0,
        minWidth: double.maxFinite,
        height: 50,
        onPressed: () async {
          // Navigator.push(context, MaterialPageRoute(builder: (_) => Menu_Principal()));
        },
        color: Colors.deepOrange,
        child: Text('Registrarse',
          style: TextStyle(color: Colors.white, fontSize: 16)
        ),
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          // side: BorderSide(color: Colors.red)
        ),
      ),
    );
  }
}