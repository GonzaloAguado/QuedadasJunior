import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyectouedadas/paginas/login.dart';
import 'package:proyectouedadas/paginas/principal.dart';

class LoginRegisterController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  static final riKey1 = const Key('__RIKEY1__');

  bool success;
  String userEmail;

  void dispose() {
    // Clean up the controller when the Widget is disposed
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void register(context) async {
    final User user = (await _auth.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    )).user;
    
    if (user != null) {
      success = true;
      print('Registro Ok');
      Future.delayed(
        Duration(seconds: 2),
        () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => Menu_Principal()));
        },
      );
      userEmail = user.email;
    } else {
      success = false;
    }
  }
}