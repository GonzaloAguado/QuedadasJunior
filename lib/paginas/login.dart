import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:proyectouedadas/paginas/principal.dart';
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
                emailTextField('Email', Icons.account_circle),
                SizedBox(height: 20),
                contraTextField('Contraseña', Icons.lock),
                SizedBox(height: 50),
                MaterialButton(
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
                  child: Text('Login',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  textColor: Colors.white,
                ),
                SizedBox(height: 20),
                MaterialButton(
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

                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => Menu_Principal()));
                  },
                  color: Color.fromRGBO(49, 134, 207, 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.google),
                      SizedBox(width: 10),
                      Text('Inicia sesión con Google',
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    ],
                  ),
                  textColor: Colors.white,
                ),
                SizedBox(height: 20),
                MaterialButton(
                  elevation: 0,
                  minWidth: double.maxFinite,
                  height: 50,
                  onPressed: () async {},
                  color: Colors.deepOrange,
                  child: Text('Registrarse',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  textColor: Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  emailTextField(String labelText, IconData icon) {
    return Container(
      decoration: BoxDecoration(
          color: primaryColor,
          border: Border.all(
            color: loginInterno,
          )),
      child: TextField(
          obscureText: false,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              labelText: labelText,
              labelStyle: TextStyle(color: Colors.white),
              focusColor: Color.fromRGBO(26, 188, 156, 1),
              icon: Icon(
                icon,
                color: secondaryColor,
              ),
              // prefix: Icon(icon),
              border: InputBorder.none)),
    );
  }

  contraTextField(String labelText, IconData icon) {
    return Container(
      decoration: BoxDecoration(
          color: primaryColor,
          border: Border.all(
            color: loginInterno,
          )),
      child: TextField(
          obscureText: true,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              labelText: labelText,
              labelStyle: TextStyle(color: Colors.white),
              icon: Icon(
                icon,
                color: secondaryColor,
              ),
              // prefix: Icon(icon),
              border: InputBorder.none)),
    );
  }
}