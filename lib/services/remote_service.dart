import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class ApiService {
  static getUsers() async {
    String dataCache = "pathString.json";
    var directory = await getTemporaryDirectory();
    final url =
        Uri.parse('https://desafiotecnicosti3.azurewebsites.net/pedido');

    File file = File("${directory.path}/$dataCache");

    if (file.existsSync()) {
      print("Reading from phone cache");

      //Lê os dados por cache
      final data = file.readAsStringSync();
      final List res = await json.decode(data);

      return res;
    } else {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        final body = response.body;

        //salvar json pro cache
        file.writeAsStringSync(body, flush: true, mode: FileMode.write);
        final List res = await jsonDecode(response.body);
        return res;
      } else {
        List json = await jsonDecode(response.body);
        return json;
      }
    }
  }
}
