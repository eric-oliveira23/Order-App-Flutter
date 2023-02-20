import 'package:flutter/material.dart';
import '../services/remote_service.dart';
import '../views/details.dart';

class OrderList extends StatelessWidget {
  const OrderList({
    super.key,
    required this.isLoaded,
  });

  final bool isLoaded;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Usuários"),
        centerTitle: true,
      ),
      body: FutureBuilder<dynamic>(
          future: ApiService.getUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var pedido = snapshot.data![index];
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(pedido: pedido),
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
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('$snapshot.error'),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
