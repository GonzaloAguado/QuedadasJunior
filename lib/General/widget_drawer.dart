
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proyectouedadas/controladores_login/login_controller.dart';
import 'package:proyectouedadas/objetos/Hijos.dart';
import 'package:proyectouedadas/paginas/crear_quedadas.dart';
import 'package:proyectouedadas/paginas/favoritos.dart';
import 'package:proyectouedadas/paginas/google_map.dart';
import 'package:proyectouedadas/paginas/historial.dart';
import 'package:proyectouedadas/paginas/login.dart';
import 'package:proyectouedadas/paginas/principal.dart';
import 'package:proyectouedadas/paginas/registro_hijos.dart';
import 'package:get/get.dart';

class Menu_lateral extends StatelessWidget {
  // const Menu_lateral({Key key}) : super(key: key);
  Color secondaryColor = Color.fromRGBO(2, 66, 26, 1);

  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: secondaryColor
            ),
            child: Column(
              children: [
                Expanded(
                  child: Image.asset('assets/logoarbol.png'),
                ),
                SizedBox(
                  height: 10.0,
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text("Busqueda"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) => Menu_Principal()));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.person_add),
            title: Text("Añadir Hijos"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) => RegistroHijos(Hijo('','','','','',''))));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.person_pin_circle_sharp),
            title: Text("Crear Quedadas"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) => Crear_Quedadas()));
            },
            enabled: true
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.history),
            title: Text("Historial"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) => Historial_Page()));
            },
            //enabled: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.star_border_purple500_sharp),
            title: Text("Favoritas"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) => Favoritos_Page()));
            },
            // enabled: false,

          ),
          Divider(),
          ListTile(
            leading: Icon(FontAwesomeIcons.map),
            title: Text("Ayuda Ubicación"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) => Mapa_Page()));
            },
            // enabled: false,
          ),
          Divider(),
          SizedBox(
            height: 60.0,
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Cerrar Sesión",
              textAlign: TextAlign.right,
              ),
            onTap: (){
              controller.signOut(context); // Salir de la sesion
              Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
            },
          ),
        ],
      )
    );
  }
}
/*
class menu_lateral extends StatelessWidget {
  Color secondaryColor = Color.fromRGBO(2, 66, 26, 1);

  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: secondaryColor
            ),
            child: Column(
              children: [
                Expanded(
                  child: Image.asset('assets/logoarbol.png'),
                ),
                SizedBox(
                  height: 10.0,
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text("Busqueda"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) => Menu_Principal()));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.person_add),
            title: Text("Añadir Hijos"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) => RegistroHijos()));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.person_pin_circle_sharp),
            title: Text("Crear Quedadas"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) => Crear_Quedadas()));
            },
            enabled: true
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.history),
            title: Text("Historial"),
            onTap: (){},
            enabled: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.star_border_purple500_sharp),
            title: Text("Favoritas"),
            onTap: (){},
            enabled: false,

          ),
          Divider(),
          ListTile(
            leading: Icon(FontAwesomeIcons.map),
            title: Text("Ayuda Ubicación"),
            onTap: (){},
            enabled: false,
          ),
          Divider(),
          SizedBox(
            height: 60.0,
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Cerrar Sesión",
              textAlign: TextAlign.right,
              ),
            onTap: (){
              controller.signOut(); // Salir de la sesion
              Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
            },
          ),
        ],
      )
    );
  }
}*/