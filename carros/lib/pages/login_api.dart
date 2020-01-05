import 'dart:convert';

import 'package:carros/pages/api_response.dart';
import 'package:carros/pages/usuario.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<ApiResponse<Usuario>> login(String login, String senha) async {
    try {
      var url = 'https://carros-springboot.herokuapp.com/api/v2/login';

      Map<String, String> headers = {"Content-Type": "application/json"};

      Map params = {
        "username": login,
        "password": senha,
      };

      String stringParams = json.encode(params);

      var response = await http.post(url, body: stringParams, headers: headers);

      Map mapResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        final user = Usuario(mapResponse["nome"], mapResponse["email"]);

        return ApiResponse.ok(user);
      }

      return ApiResponse.error(mapResponse["error"]);
    } catch (error, exception) {
      return ApiResponse.error("Não foi possível se conectar ao servidor");
    }
  }
}
