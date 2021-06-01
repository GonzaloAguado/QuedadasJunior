import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:proyectouedadas/paginas/login.dart';


final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

class Inicio extends StatelessWidget {
  //const LogIn({Key key}) : super(key: key);
  Color primaryColor = Color.fromRGBO(2, 66, 26, 1);
  Color logoGreen = Color.fromRGBO(39, 174, 96 , 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: primaryColor,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //We take the image from the assets
            Image.asset(
              'assets/inicio.PNG',
              height: 200,
            ),
            SizedBox(
              height: 55,
            ),
            // Texto de bienvenida
            Text(
              'Bienvenido a Q.J !',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'La app de quedadas para tus hijos! \nDale a QUEDAR para comenzar.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            SizedBox(
              height: 30,
            ),
            //Our MaterialButton which when pressed will take us to a new screen named as 
            // Boton de Login
            MaterialButton(
              elevation: 0,
              height: 50,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
              },
              color: logoGreen,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                // side: BorderSide(color: Colors.red)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Vamos a Quedar',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                    Icon(Icons.arrow_forward_ios)
                ],
              ),
              textColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}

_signInWithGoogle() async {
  final GoogleSignInAccount googleUser = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  final AuthCredential credential = GoogleAuthProvider.credential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
  final User user = (await firebaseAuth.signInWithCredential(credential)).user;
}