import 'package:app_pedidos/components/order_list.dart';
import 'package:flutter/material.dart';

import '../models/pedido.dart';
import '../services/remote_service.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool isLoaded = false;
  List<Pedido>? pedidos = [];
  List<Pedido>? results = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    pedidos = await RemoteService().getPedidos();
    if (pedidos != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = pedidos;
    } else {
      results = pedidos!
          .where((pedido) => pedido.cliente.nome
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      pedidos = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 40,
          left: 12,
          right: 12,
        ),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            Expanded(
              child: OrderList(
                isLoaded: isLoaded,
                pedidos: pedidos,
              ),
            )
          ],
        ),
      ),
    );
  }
}
