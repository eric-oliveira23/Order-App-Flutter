import '../models/pedido.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<Pedido>?> getPedidos() async {
    var client = http.Client();

    var uri = Uri.parse('https://desafiotecnicosti3.azurewebsites.net/pedido');
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return pedidoFromJson(json);
    }
    return null;
  }
}
