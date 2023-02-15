import 'package:app_pedidos/components/order_list.dart';
import 'package:app_pedidos/components/separator.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
  List<Pedido>? _pedidosEncontrados = [];

  @override
  void initState() {
    getData();
    _pedidosEncontrados = pedidos;
    super.initState();
  }

  // Função chamada caso ocorra qualquer mudança no textfield
  void _runFilter(String enteredKeyword) {
    List<Pedido>? result = [];
    if (enteredKeyword.isEmpty) {
      // se o campo de pesquisa estiver vazio, mostrará todos os usuários
      result = pedidos;
    } else {
      result = pedidos
          ?.where((pedido) => pedido.cliente.nome
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _pedidosEncontrados = result;
    });
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
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 40,
              left: 12,
              right: 12,
            ),
            child: TextField(
              onChanged: (value) => {_runFilter(value)},
              decoration: const InputDecoration(
                labelText: 'Insira o nome',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          _pedidosEncontrados!.isNotEmpty
              ? Expanded(
                  child: OrderList(
                    isLoaded: isLoaded,
                    pedidos: _pedidosEncontrados,
                  ),
                )
              : Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Nada encontrado.",
                        style: TextStyle(fontSize: 18),
                      ),
                      const SeparatorMain(),
                      Lottie.asset(
                        'assets/lottie/empty.json',
                        height: 180,
                        width: 180,
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
