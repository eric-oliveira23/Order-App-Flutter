// import 'package:app_pedidos/models/pedido.dart';
// import 'package:flutter/material.dart';
// import 'package:sqflite/sqflite.dart';

// import '../database/db.dart';

// class PedidoRepository extends ChangeNotifier {
//   late Database db;
//   List<Pedido> _pedidos = [];

//   List<Pedido> get pedidos => _pedidos;

//   PedidoRepository() {
//     _initRepository() async {
//       await getPedidos();
//     }
//   }

//   getPedidos() async {
//     db = await DB.instance.database;
//     List pedido = await db.query('pedido');
//   }
// }
