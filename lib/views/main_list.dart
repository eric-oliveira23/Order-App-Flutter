import 'package:app_pedidos/models/pedido.dart';
import 'package:app_pedidos/services/remote_service.dart';
import 'package:app_pedidos/views/details.dart';
import 'package:flutter/material.dart';

import '../components/order_list.dart';

class MainList extends StatefulWidget {
  const MainList({super.key});

  @override
  State<MainList> createState() => _MainListState();
}

class _MainListState extends State<MainList> {
  List<Pedido>? pedidos = [];
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    pedidos = await RemoteService().getPedidos();
    if (pedidos != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrderList(
        isLoaded: isLoaded,
        pedidos: pedidos,
      ),
    );
  }
}
