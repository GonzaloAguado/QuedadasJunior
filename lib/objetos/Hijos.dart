
import 'package:firebase_database/firebase_database.dart';

class Hijo {

  Hijo(this._nombrePadre, this._nombreHijo, this._fechaNacimiento, this._genero, this._gusto, this._hobbie);

  String _nombrePadre;
  String _nombreHijo;
  String _fechaNacimiento;
  String _genero;
  String _gusto;
  String _hobbie;

  Hijo.map(dynamic obj){
    this._nombrePadre = obj['nombrePadre'];
    this._nombreHijo = obj['nombreHijo'];
    this._fechaNacimiento = obj['fechaNacimiento'];
    this._genero = obj['genero'];
    this._gusto = obj['gusto'];
    this._hobbie = obj['hobbie'];

  }

  String get nombrePadre => _nombrePadre;
  String get nombreHijo => _nombreHijo;
  String get fechaNacimiento => _fechaNacimiento;
  String get genero => _genero;
  String get gusto => _gusto;
  String get hobbie => _hobbie;

  Hijo.fromSnapShot(DataSnapshot snapshot){
    _nombrePadre = snapshot.value['nombrePadre'];
    _nombreHijo = snapshot.value['nombreHijo'];
    _fechaNacimiento = snapshot.value['fechaNacimiento'];
    _genero = snapshot.value['genero'];
    _gusto = snapshot.value['gusto'];
    _hobbie = snapshot.value['hobbie'];
  }
}