import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:proyectouedadas/General/widget_drawer.dart';
import 'package:proyectouedadas/objetos/Hijos.dart';
import 'package:proyectouedadas/paginas/login.dart';
import 'package:proyectouedadas/paginas/registro_hijos.dart';


class Menu_Principal extends StatefulWidget {
  // Menu_Principal({Key key}) : super(key: key);
  static String id = 'products_page';

  @override
  _Menu_PrincipalState createState() => _Menu_PrincipalState();
}

class _Menu_PrincipalState extends State<Menu_Principal> {

  final hijoreferencia = FirebaseDatabase.instance.reference().child('hijo');

  @override
  void initState() { 
    super.initState();
  }

  @override
  void dispose() { 
    super.dispose();
  }

  // Colores para la pagina
  Color secondaryColor = (Color.fromRGBO(2, 66, 26,1));
  Color fondo2 = (Color.fromRGBO(192, 255, 186, 1));
  Color primaryColor = Color.fromRGBO(39, 174, 96 , 1);
  Color logoGreen = Color(0xff25bcbb);
  Color loginInterno = Color.fromRGBO(27, 30, 28, 1);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Busqueda"),
        ),
        drawer: Menu_lateral(),
        body: Stack(
          fit: StackFit.expand,
          children: [
            buildFloatingSearchBar(context),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.group_add_outlined),
          onPressed: (){
            // Navigator.push(context, MaterialPageRoute(builder: (_) => RegistroHijos()));
            _crearNuevoHijo(context);
          },
        ),
      )
    );
  }


  @override
  Widget buildFloatingSearchBar(context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return FloatingSearchBar(
      hint: 'Buscar...',
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {
      },
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.place),
            onPressed: () {},
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.white,
            elevation: 4.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: Colors.accents.map((color) {
                return Container(height: 112, color: color);
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  Widget _cardTipo1(){
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text("Soy el titulo de la tarjeta"),
            subtitle: Text("Aqui estamos en la descripcion de una tarjeta para una idea para llegar a conseguir nuestras paginas web")
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text("Cancelar"),
                onPressed: () {},
              ),
              FlatButton(
                child: Text("Vale"),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }
   
   
  Widget _cardTipo2(){
    final card =  Container(
      
      child: Column(
        children: <Widget>[

          FadeInImage(
            placeholder: AssetImage("assets/jar-loading.gif"), 
            image: NetworkImage("https://www.theolivepress.es/wp-content/uploads/2019/02/High-frontier.jpg"),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text("NO se nada de nada")
            
          )
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              spreadRadius: 2.0,
              offset: Offset(2.0,10.0)
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );
  }

  void _crearNuevoHijo(BuildContext context) async{
    await Navigator.push(context, 
      MaterialPageRoute(builder:
        (context) => RegistroHijos(Hijo('', '', '', '', '', '')),
      )
    );
  }
}