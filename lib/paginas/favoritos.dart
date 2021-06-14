import 'package:flutter/material.dart';
import 'package:proyectouedadas/General/widget_drawer.dart';


class Favoritos_Page extends StatefulWidget {
  Favoritos_Page({Key key}) : super(key: key);

  @override
  _Favoritos_PageState createState() => _Favoritos_PageState();
}

class _Favoritos_PageState extends State<Favoritos_Page> {
  //COlores
  Color fondo2 = (Color.fromRGBO(192, 255, 186, 1));
  Color verdePOtentorro = Color.fromRGBO(2, 66, 26, 1);
  Color primaryColor = Color.fromRGBO(39, 174, 96 , 1);
  Color logoGreen = Color(0xff25bcbb);
  Color loginInterno = Color.fromRGBO(27, 30, 28, 1);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: verdePOtentorro,
          elevation: 0,
          title: Text("Favoritos"),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 20.0),
              child: CircleAvatar(
                child: Text ("G"),
                backgroundColor: Colors.white,
              ),
            ),
          ],
        ),
        drawer: Menu_lateral(),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: <Widget>[
              _cardTipo2(),
              _cardTipo1(),
              SizedBox(height: 20,),
              _cardTipo2(),
              _cardTipo1(),
              SizedBox(height: 20,),
              _cardTipo2(),
              _cardTipo1(),
              SizedBox(height: 20,),
              _cardTipo2(),
              _cardTipo1(),
              SizedBox(height: 20,),
              _cardTipo2(),
              _cardTipo1(),
              SizedBox(height: 20,),
              _cardTipo2(),
              _cardTipo1(),
              SizedBox(height: 20,),
              _cardTipo2(),
              _cardTipo1(),
            ],
          ),
        ) 
      ),
    );
  }

  Widget _cardTipo1(){
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            title: Text("Avenida de las comarcas/Parque"),
            subtitle: Text("Merienda: Si                                      1/5")
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              
              FlatButton(
                child: Text("Unirse"),
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
            image: AssetImage("assets/parque.jpg") ,
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Creado por el padre: Gonzalo Aguado",
              style: TextStyle(color: Colors.white),
            ),      
          )
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: verdePOtentorro,
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
}
