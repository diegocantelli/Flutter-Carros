import 'dart:convert' as convert;

import 'package:carros/pages/carro.dart';
import 'package:http/http.dart' as http;

class TipoCarro {
  static final String classicos = "classicos";
  static final String esportivos = "esportivos";
  static final String luxo = "luxo";
}

class CarrosApi {
  static Future<List<Carro>> getCarros(String tipoCarro) async {
    var url =
        'https://carros-springboot.herokuapp.com/api/v1/carros/tipo/$tipoCarro';

    print("url api $url");

    var response = await http.get(url);

    String json = response.body;

    List list = convert.json.decode(json);

    final carros = List<Carro>();

    for (Map map in list) {
      Carro c = Carro.fromJson(map);
      carros.add(c);
    }

    return carros;
  }
}
