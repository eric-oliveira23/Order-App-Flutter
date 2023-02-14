import 'package:app_pedidos/models/pedido.dart';
import 'package:app_pedidos/services/remote_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        body: Visibility(
      visible: isLoaded,
      replacement: const Center(
        child: CircularProgressIndicator(),
      ),
      child: ListView.builder(
        itemCount: pedidos?.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(pedidos![index].numero.toString()),
          );
        },
      ),
    ));
  }
}
