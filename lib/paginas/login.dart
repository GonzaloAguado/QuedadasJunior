import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:proyectouedadas/paginas/principal.dart';
import 'package:proyectouedadas/paginas/registro.dart';
import 'Inicio.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  'Inicia sesión en \nQuedadas Junior',
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
                _botonInicioNormal(context),
                SizedBox(height: 20),
                _botonInicioGoogle(context),
                SizedBox(height: 20),
                _botonRegistro(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  // Metodo del Boton de inicio de sesion
  Widget _botonInicioNormal(BuildContext context){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: MaterialButton(
        elevation: 0,
        minWidth: double.maxFinite,
        height: 50,
        onPressed: () async {
          User firebaseUser;
          firebaseAuth.signInWithEmailAndPassword(
            email: 'demo@gmail.com', password: '123456').then((UserCredential) {});
            setState(() {
              firebaseUser = UserCredential as User;
            });
            print(firebaseUser.email);
          },
        color: secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          // side: BorderSide(color: Colors.red)
        ),
        child: Text('Login',
            style: TextStyle(color: Colors.white, fontSize: 16)),
            textColor: Colors.white,
      ),
    );
  }

  // Metodo del Boton de inicio de sesion con Google
  Widget _botonInicioGoogle(BuildContext context){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: MaterialButton(
        elevation: 0,
        minWidth: double.maxFinite,
        height: 50,
        onPressed: () async {
          final GoogleSignInAccount googleUser = await googleSignIn.signIn();
          final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
          final AuthCredential credential = GoogleAuthProvider.credential(
            idToken: googleAuth.idToken,
            accessToken: googleAuth.accessToken);
          final User user =(await firebaseAuth.signInWithCredential(credential)).user;
          
          Navigator.push(context, MaterialPageRoute(builder: (_) => Menu_Principal()));
        },
        color: Color.fromRGBO(49, 134, 207, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          // side: BorderSide(color: Colors.red)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(FontAwesomeIcons.google),
            SizedBox(width: 10),
            Text('Login con Google',
              style: TextStyle(color: Colors.white, fontSize: 16)),
          ],
        ),
        textColor: Colors.white,
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
          Navigator.push(context, MaterialPageRoute(builder: (_) => Registro()));
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
}