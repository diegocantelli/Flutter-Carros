import 'dart:convert' as convert;

import 'package:carros/pages/carro.dart';
import 'package:http/http.dart' as http;

class CarrosApi {
  static Future<List<Carro>> getCarros() async {
    var url = 'https://carros-springboot.herokuapp.com/api/v1/carros';

    var response = await http.get(url);

    String json = response.body;
    print("json vindo do body $json");

    List list = convert.json.decode(json);
    print("Lista após o json.decode vindo do body $list");

    final carros = List<Carro>();

    for (Map map in list) {
      Carro c = Carro.fromJson(map);
      carros.add(c);
    }

    return carros;
  }
}
