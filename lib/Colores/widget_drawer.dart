
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proyectouedadas/paginas/login.dart';
import 'package:proyectouedadas/paginas/principal.dart';
import 'package:proyectouedadas/paginas/registro_hijos.dart';


class menu_lateral extends StatelessWidget {

  Color secondaryColor = Color(0xff232c51);

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
                  child: Image.asset('assets/portada.png'),
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
            onTap: (){},
            enabled: false
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
              Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
            },
          ),
        ],
      )
    );
  }
}