import 'package:app_pedidos/components/separator.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../services/remote_service.dart';
import 'details.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String searchString = '';

  @override
  void initState() {
    super.initState();
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
              onChanged: (value) => {
                setState(() {
                  searchString = value;
                })
              },
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
          Expanded(
            child: FutureBuilder<dynamic>(
                future: ApiService.getUsers(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          var pedido = snapshot.data![index];
                          String pedidoNome = pedido['cliente']['nome'];
                          return pedidoNome
                                  .toLowerCase()
                                  .contains(searchString.toLowerCase())
                              ? ListTile(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DetailsPage(pedido: pedido),
                                        ));
                                  },
                                  leading: CircleAvatar(
                                    child: Text(
                                      pedido['numero'].toString(),
                                    ),
                                  ),
                                  title: Text(
                                    pedido['cliente']['nome'],
                                  ),
                                  subtitle: Text(
                                    pedido['enderecoEntrega']['endereco'],
                                  ),
                                )
                              : const SizedBox();
                        });
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('$snapshot.error'),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }),
          )
        ],
      ),
    );
  }
}
