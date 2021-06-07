import 'package:get/route_manager.dart';
import 'package:proyectouedadas/objetos/Hijos.dart';
import 'package:proyectouedadas/paginas/crear_quedadas.dart';
import 'package:proyectouedadas/paginas/login.dart';
import 'package:proyectouedadas/paginas/principal.dart';
import 'package:proyectouedadas/paginas/registro.dart';
import 'package:proyectouedadas/paginas/registro_hijos.dart';

routes() => [
      GetPage(name: "/loginpage", page: () => LoginScreen()),
      GetPage(name: "/registration", page: () => Registro()),
      GetPage(name: "/principal", page: () => Menu_Principal()),
      GetPage(name: "/registrohijos", page: () => RegistroHijos(Hijo('','','','','','')), transition: Transition.zoom),
      GetPage(name: "/crearQuedadas", page: () => Crear_Quedadas(), transition: Transition.zoom),
    ];