import 'package:flutter/material.dart';
import '../models/pedido.dart';
import '../views/details.dart';

class OrderList extends StatelessWidget {
  const OrderList({
    super.key,
    required this.isLoaded,
    required this.pedidos,
  });

  final bool isLoaded;
  final List<Pedido>? pedidos;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoaded,
      replacement: const Center(
        child: CircularProgressIndicator(),
      ),
      child: ListView.builder(
        itemCount: pedidos?.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(pedido: pedidos![index]),
                ),
              );
            },
            leading: CircleAvatar(
              child: Text(
                pedidos![index].numero.toString(),
              ),
            ),
            title: Text(pedidos![index].cliente.nome),
            subtitle: Text(pedidos![index].status),
            trailing: Text('R\$ ${pedidos![index].valorTotal}'),
          );
        },
      ),
    );
  }
}
