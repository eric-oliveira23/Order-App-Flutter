import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../components/detail_label.dart';
import '../components/sections_label.dart';
import '../components/separator.dart';
import '../models/pedido.dart';

class DetailsPage extends StatelessWidget {
  final Pedido pedido;
  const DetailsPage({super.key, required this.pedido});

  @override
  Widget build(BuildContext context) {
    //
    String bairro = pedido.enderecoEntrega.bairro;
    String referencia = pedido.enderecoEntrega.referencia;
    String complemento = pedido.enderecoEntrega.complemento;
    String empty = 'Não informado';
    String documento =
        pedido.cliente.cnpj.isEmpty ? pedido.cliente.cpf : pedido.cliente.cnpj;

    List<Item> itens = [];
    itens = pedido.itens;

    List<Pagamento> pagamentos = [];
    pagamentos = pedido.pagamento;

    return Scaffold(
      appBar: AppBar(
        title: Text(pedido.cliente.nome),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left_sharp,
            size: 25,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          tooltip: 'Voltar',
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const DetailLabel(label: 'Data de criação'),
            Text(
              DateFormat("dd/MM/yyyy").format(
                DateTime.parse(
                  pedido.dataCriacao.toString(),
                ),
              ),
            ),
            const SeparatorMain(),
            //
            const DetailLabel(label: 'Data de alteração'),
            Text(
              DateFormat("dd/MM/yyyy").format(
                DateTime.parse(
                  pedido.dataAlteracao.toString(),
                ),
              ),
            ),

            //
            const SeparatorMain(),
            const SectionsLabel(
              label: 'Detalhes da entrega',
            ),
            const SeparatorMain(),
            //

            const DetailLabel(label: 'Endereço de entrega'),
            Text(pedido.enderecoEntrega.endereco),
            const SeparatorMain(),
            //
            const DetailLabel(label: 'Número'),
            Text(pedido.enderecoEntrega.numero),
            const SeparatorMain(),
            //
            const DetailLabel(label: 'CEP'),
            Text(pedido.enderecoEntrega.cep),
            const SeparatorMain(),
            //
            const DetailLabel(label: 'Bairro'),
            Text(bairro.isEmpty ? empty : bairro),
            const SeparatorMain(),
            //
            const DetailLabel(label: 'Cidade'),
            Text(pedido.enderecoEntrega.cidade),
            const SeparatorMain(),
            //
            const DetailLabel(label: 'Estado'),
            Text(pedido.enderecoEntrega.estado),
            const SeparatorMain(),
            //
            const DetailLabel(label: 'Complemento'),
            Text(complemento.isEmpty ? empty : referencia),
            const SeparatorMain(),
            //
            const DetailLabel(label: 'Referência'),
            Text(referencia.isEmpty ? empty : referencia),
            const SeparatorMain(),

            //
            const SectionsLabel(label: 'Detalhes do cliente'),
            const SeparatorMain(),
            //

            //
            const DetailLabel(label: 'Nome do cliente'),
            Text(pedido.cliente.nome),
            const SeparatorMain(),
            //
            const DetailLabel(label: 'Documento'),
            Text(documento),
            const SeparatorMain(),

            //
            const DetailLabel(label: 'Nascimento'),
            Text(
              DateFormat("dd/MM/yyyy").format(
                DateTime.parse(
                  pedido.cliente.dataNascimento.toString(),
                ),
              ),
            ),
            const SeparatorMain(),
            //
            const DetailLabel(label: 'Email'),
            Text(pedido.cliente.email),
            const SeparatorMain(),

            //Items Section

            //
            const SectionsLabel(label: 'Itens'),
            const SeparatorMain(),
            //

            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: itens.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    pedido.itens[index].nome,
                    style: const TextStyle(
                      fontSize: 14,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  subtitle: Text(
                    '${pedido.itens[index].quantidade}x',
                    style: const TextStyle(fontSize: 16),
                  ),
                  trailing: Text('R\$ ${pedido.itens[index].valorUnitario}'),
                );
              },
            ),

            //Payments Section

            //
            const SeparatorMain(),
            const SectionsLabel(label: 'Pagamentos'),
            const SeparatorMain(),
            //

            ListView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: pagamentos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    pedido.pagamento[index].nome,
                    style: const TextStyle(
                      fontSize: 14,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  subtitle: Text(
                    'Parcela ${pedido.pagamento[index].parcela}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  trailing: Text('R\$ ${pedido.pagamento[index].valor}'),
                );
              },
            ),

            //
            const SeparatorMain(),
            //

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Desconto'),
                        Text('R\$ ${pedido.desconto}'),
                      ]),

                  //
                  const SeparatorSmall(),
                  //

                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Frete'),
                        Text('R\$ ${pedido.frete}'),
                      ]),

                  //
                  const SeparatorSmall(),
                  //

                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Subtotal'),
                        Text('R\$ ${pedido.subTotal}'),
                      ]),

                  //
                  const SeparatorSmall(),
                  //

                  Container(
                      width: double.infinity, height: 0.5, color: Colors.black),

                  //
                  const SeparatorSmall(),
                  //

                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Total'),
                        Text('R\$ ${pedido.valorTotal}'),
                      ]),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
