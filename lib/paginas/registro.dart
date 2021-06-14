import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:proyectouedadas/controladores_login/registration_login_controller.dart';

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
  final controller = Get.put(LoginRegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GetBuilder<LoginRegisterController>(
        init: LoginRegisterController(),
        builder: (_) {
          return SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(26.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Regístrate en \nQuedadas Junior',
                        textAlign: TextAlign.center,
                        style:
                            GoogleFonts.openSans(color: primaryColor, fontSize: 28),
                      ),
                      SizedBox(height: 50,),
                      _crearCorreo(),
                      SizedBox(height: 20,),
                      _crearContra(),
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: MaterialButton(
                          elevation: 0,
                          minWidth: double.maxFinite,
                          height: 50,
                          onPressed: () async {
                            _.register(context);
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
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(controller.success == null
                            ? ''
                            : (controller.success
                                ? 'Successfully registered ' +
                                    controller.userEmail
                                : 'Registration failed')),
                      ),
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
  

  Widget _crearCorreo() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: TextFormField(
        controller: controller.emailController,
          validator: (String value) {
          if (value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
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

  Widget _crearContra() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: TextFormField(
        controller: controller.passwordController,
          validator: (String value) {
          if (value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
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

  // Metodo del Boton de registro
  Widget _botonRegistro(BuildContext context){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: MaterialButton(
        elevation: 0,
        minWidth: double.maxFinite,
        height: 50,
        onPressed: () async {
          //_.register(context);
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