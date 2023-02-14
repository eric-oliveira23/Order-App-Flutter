// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Pedido> pedidoFromJson(String str) =>
    List<Pedido>.from(json.decode(str).map((x) => Pedido.fromJson(x)));

String welcomeToJson(List<Pedido> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pedido {
  Pedido({
    required this.id,
    required this.numero,
    required this.dataCriacao,
    required this.dataAlteracao,
    required this.status,
    required this.desconto,
    required this.frete,
    required this.subTotal,
    required this.valorTotal,
    required this.cliente,
    required this.enderecoEntrega,
    required this.itens,
    required this.pagamento,
  });

  String id;
  int numero;
  DateTime dataCriacao;
  DateTime dataAlteracao;
  String status;
  double desconto;
  double frete;
  double subTotal;
  double valorTotal;
  Cliente cliente;
  EnderecoEntrega enderecoEntrega;
  List<Item> itens;
  List<Pagamento> pagamento;

  factory Pedido.fromJson(Map<String, dynamic> json) => Pedido(
        id: json["id"],
        numero: json["numero"],
        dataCriacao: DateTime.parse(json["dataCriacao"]),
        dataAlteracao: DateTime.parse(json["dataAlteracao"]),
        status: json["status"]!,
        desconto: json["desconto"]?.toDouble(),
        frete: json["frete"]?.toDouble(),
        subTotal: json["subTotal"]?.toDouble(),
        valorTotal: json["valorTotal"]?.toDouble(),
        cliente: Cliente.fromJson(json["cliente"]),
        enderecoEntrega: EnderecoEntrega.fromJson(json["enderecoEntrega"]),
        itens: List<Item>.from(json["itens"].map((x) => Item.fromJson(x))),
        pagamento: List<Pagamento>.from(
            json["pagamento"].map((x) => Pagamento.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "numero": numero,
        "dataCriacao": dataCriacao.toIso8601String(),
        "dataAlteracao": dataAlteracao.toIso8601String(),
        "status": statusValues.reverse[status],
        "desconto": desconto,
        "frete": frete,
        "subTotal": subTotal,
        "valorTotal": valorTotal,
        "cliente": cliente.toJson(),
        "enderecoEntrega": enderecoEntrega.toJson(),
        "itens": List<dynamic>.from(itens.map((x) => x.toJson())),
        "pagamento": List<dynamic>.from(pagamento.map((x) => x.toJson())),
      };
}

class Cliente {
  Cliente({
    required this.id,
    required this.cnpj,
    required this.cpf,
    required this.nome,
    required this.razaoSocial,
    required this.email,
    required this.dataNascimento,
  });

  String id;
  String cnpj;
  String cpf;
  String nome;
  String razaoSocial;
  String email;
  DateTime dataNascimento;

  factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
        id: json["id"],
        cnpj: json["cnpj"],
        cpf: json["cpf"],
        nome: json["nome"],
        razaoSocial: json["razaoSocial"],
        email: json["email"],
        dataNascimento: DateTime.parse(json["dataNascimento"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cnpj": cnpj,
        "cpf": cpf,
        "nome": nome,
        "razaoSocial": razaoSocial,
        "email": email,
        "dataNascimento": dataNascimento.toIso8601String(),
      };
}

class EnderecoEntrega {
  EnderecoEntrega({
    required this.id,
    required this.endereco,
    required this.numero,
    required this.cep,
    required this.bairro,
    required this.cidade,
    required this.estado,
    required this.complemento,
    required this.referencia,
  });

  String id;
  String endereco;
  String numero;
  String cep;
  String bairro;
  Cidade cidade;
  Estado estado;
  String complemento;
  String referencia;

  factory EnderecoEntrega.fromJson(Map<String, dynamic> json) =>
      EnderecoEntrega(
        id: json["id"],
        endereco: json["endereco"],
        numero: json["numero"],
        cep: json["cep"],
        bairro: json["bairro"],
        cidade: cidadeValues.map[json["cidade"]]!,
        estado: estadoValues.map[json["estado"]]!,
        complemento: json["complemento"],
        referencia: json["referencia"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "endereco": endereco,
        "numero": numero,
        "cep": cep,
        "bairro": bairro,
        "cidade": cidadeValues.reverse[cidade],
        "estado": estadoValues.reverse[estado],
        "complemento": complemento,
        "referencia": referencia,
      };
}

enum Cidade { CENTRAL_CITY, ARGO_CITY, STAR_CITY }

final cidadeValues = EnumValues({
  "Argo City": Cidade.ARGO_CITY,
  "Central City": Cidade.CENTRAL_CITY,
  "Star City": Cidade.STAR_CITY
});

enum Estado { KS, KT, CA }

final estadoValues =
    EnumValues({"CA": Estado.CA, "KS": Estado.KS, "KT": Estado.KT});

class Item {
  Item({
    required this.id,
    required this.idProduto,
    required this.nome,
    required this.quantidade,
    required this.valorUnitario,
  });

  String id;
  String idProduto;
  String nome;
  int quantidade;
  double valorUnitario;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        idProduto: json["idProduto"],
        nome: json["nome"],
        quantidade: json["quantidade"],
        valorUnitario: json["valorUnitario"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "idProduto": idProduto,
        "nome": nome,
        "quantidade": quantidade,
        "valorUnitario": valorUnitario,
      };
}

class Pagamento {
  Pagamento({
    required this.id,
    required this.parcela,
    required this.valor,
    required this.codigo,
    required this.nome,
  });

  String id;
  int parcela;
  double valor;
  Codigo codigo;
  Nome nome;

  factory Pagamento.fromJson(Map<String, dynamic> json) => Pagamento(
        id: json["id"],
        parcela: json["parcela"],
        valor: json["valor"]?.toDouble(),
        codigo: codigoValues.map[json["codigo"]]!,
        nome: nomeValues.map[json["nome"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "parcela": parcela,
        "valor": valor,
        "codigo": codigoValues.reverse[codigo],
        "nome": nomeValues.reverse[nome],
      };
}

enum Codigo { PAGSEGURO, BOLETO, TRANSF }

final codigoValues = EnumValues({
  "boleto": Codigo.BOLETO,
  "pagseguro": Codigo.PAGSEGURO,
  "transf": Codigo.TRANSF
});

enum Nome { PAG_SEGURO, BOLETO, TRANSFERNCIA }

final nomeValues = EnumValues({
  "Boleto": Nome.BOLETO,
  "PagSeguro": Nome.PAG_SEGURO,
  "Transferência": Nome.TRANSFERNCIA
});

enum Status { APROVADO, CANCELADO }

final statusValues =
    EnumValues({"APROVADO": Status.APROVADO, "CANCELADO": Status.CANCELADO});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
