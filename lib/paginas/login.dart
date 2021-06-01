import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:proyectouedadas/controladores_login/login_controller.dart';
import 'package:proyectouedadas/paginas/principal.dart';
import 'package:proyectouedadas/paginas/registro.dart';
import 'Inicio.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Color primaryColor = (Color.fromRGBO(2, 66, 26,1));
  Color secondaryColor = Color.fromRGBO(39, 174, 96 , 1);
  Color logoGreen = Color(0xff25bcbb);
  Color loginInterno = Color.fromRGBO(27, 30, 28, 1);

  final controller = Get.put(LoginController());
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GetBuilder<LoginController>(
        init: LoginController(),
        builder: (_) {
          return SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          'Inicia sesión en \nQuedadas Junior',
                          textAlign: TextAlign.center,
                          style:
                              GoogleFonts.openSans(color: primaryColor, fontSize: 28),
                        ),
                        alignment: Alignment.center,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      _crearCorreo(),
                      SizedBox(height: 15,),
                      _crearContra(),
                      SizedBox(height: 50,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: MaterialButton(
                          elevation: 0,
                          minWidth: double.maxFinite,
                          height: 50,
                          onPressed: () async {
                            _.signInWithEmailAndPassword(context);
                          },
                          color: secondaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            
                          ),
                          child: Text('Login',
                              style: TextStyle(color: Colors.white, fontSize: 16)),
                              textColor: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: MaterialButton(
                          elevation: 0,
                          minWidth: double.maxFinite,
                          height: 50,
                          onPressed: () async {
                            _.signInWithGoogle(context);
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
                      ),
                      SizedBox(height: 20,),
                      _botonRegistro(context),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
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
          //_.signInWithEmailAndPassword(context);
        },
        color: secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          
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
          //_.signInWithGoogle(context);
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

  // Crear correo input
  Widget _crearCorreo() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: TextFormField(
        controller: controller.emailController,
        validator: (String value) {
        if (value.isEmpty) return 'Please enter some text';
          return null;
        },
        //autofocus: true,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          fillColor: primaryColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: Colors.deepOrange),
          ),
          labelText: "Email",
          labelStyle: TextStyle(color: primaryColor),
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

  //Crear input contraseña
  Widget _crearContra() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: TextFormField(
        controller: controller.passwordController,
        keyboardType: TextInputType.text,
        inputFormatters: <TextInputFormatter>[
          //FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ],
        validator: (String value) {
          if (value.isEmpty)
            return 'Please enter some text or numbers';
          return null;
        },
        //autofocus: true,
        obscureText: true,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: Colors.deepOrange),
          ),
          labelText: "Contraseña",
          labelStyle: TextStyle(color: primaryColor),
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