import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/clima_atual_model.dart';
import '../models/clima_hora_model.dart';
import '../models/clima_dia_model.dart';

class ClimaTempo {
  static final String baseUrl = 'http://apiadvisor.climatempo.com.br/api/v1';
  static final String token = 'a9992d30bb29efb00cbd17e579f995f8';

  static String _handlerErro(String dados) {
    return json.decode(dados)["detail"];
  }

  static Future<int> idCidadePeloNome(String cidade, uf) async {
    final response = await http
        .get('$baseUrl/locale/city?name=$cidade&state=$uf&token=$token');

    if (response.statusCode == 200) {
      return json.decode(response.body)[0]['id'];
    } else {
      throw Exception('Falha ao Buscar o ID da Cidade:\n${_handlerErro(response.body)}');
    }
  }

  static Future<ClimaAtual> tempoMomento(int idCidade) async {
    final response = await http
        .get('$baseUrl/weather/locale/$idCidade/current?token=$token');

    if (response.statusCode == 200) {
      return ClimaAtual.fromJson(json.decode(response.body)['data']);
    } else {
      throw Exception('Falha ao Buscar o Clima Atual:\n${_handlerErro(response.body)}');
    }
  }

  static Future<List<ClimaHora>> proximasHoras(int idCidade) async {
    final response = await http
        .get('$baseUrl/forecast/locale/$idCidade/hours/72?token=$token');

    if (response.statusCode == 200) {
      List<ClimaHora> climas = new List<ClimaHora>();
      for (var hora in json.decode(response.body)['data']) {
        climas.add(ClimaHora.fromJson(hora));
      }
      return climas;
    } else {
      throw Exception('Falha ao Buscar o Clima das Próximas Horas:\n${_handlerErro(response.body)}');
    }
  }

  static Future<List<ClimaDia>> proximosDias(int idCidade) async {
    final response = await http
        .get('$baseUrl/forecast/locale/$idCidade/days/15?token=$token');

    if (response.statusCode == 200) {
      List<ClimaDia> climas = new List<ClimaDia>();
      for (var dia in json.decode(response.body)['data']) {
        climas.add(ClimaDia.fromJson(dia));
      }
      return climas;
    } else {
      throw Exception('Falha ao Buscar o Clima dos Próximos Dias:\n${_handlerErro(response.body)}');
    }
  }
}
