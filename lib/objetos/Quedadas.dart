
import 'package:firebase_database/firebase_database.dart';

class Quedadas {

  Quedadas(this._fecha, this._merienda, this._actividad, this._map);

  String _fecha;
  bool _merienda;
  String _actividad;
  String _map;

  Quedadas.map(dynamic obj){
    this._fecha = obj['fecha'];
    this._merienda = obj['merienda'];
    this._actividad = obj['actividad'];
    this._map = obj['map'];
  }

  String get fecha => _fecha;
  bool get merienda => _merienda;
  String get actividad => _actividad;
  String get map => _map;

  Quedadas.fromSnapShot(DataSnapshot snapshot){
    _fecha = snapshot.value['fecha'];
    _merienda = snapshot.value['merienda'];
    _actividad = snapshot.value['actividad'];
    _map = snapshot.value['map'];
  }
}