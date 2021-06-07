import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:proyectouedadas/paginas/Inicio.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value){
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget { 
  Color verdePOtentorro = Color.fromRGBO(2, 66, 26, 1);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryIconTheme: IconThemeData(
          color: verdePOtentorro,
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Quedadas Junior',
      home: Inicio(),
      
      // Localizaciones del idioma
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''), // English, no country code
        const Locale('es', ''), // Spanish, no country code
      ],
    );
  }
}