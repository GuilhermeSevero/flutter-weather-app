import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/clima_atual_model.dart';
import '../models/clima_hora_model.dart';
import '../models/clima_dia_model.dart';

class ClimaTempo {
  static final String baseUrl = 'http://apiadvisor.climatempo.com.br/api/v1';
  static final String token = 'a9992d30bb29efb00cbd17e579f995f8';

  static ClimaAtual _climaAtual;
  static List<ClimaHora> _climaHora;
  static List<ClimaDia> _climaDia;

  static String _handlerErro(String dados) {
    return json.decode(dados)["detail"] ?? json.decode(dados);
  }

  static Future<int> idCidadePeloNome(String cidade, uf) async {
    final response = await http
        .get('$baseUrl/locale/city?name=$cidade&state=$uf&token=$token');

    if (response.statusCode == 200) {
      return json.decode(response.body)[0]['id'];
    } else {
      throw Exception(
          'Falha ao Buscar o ID da Cidade:\n${_handlerErro(response.body)}');
    }
  }

  static Future<ClimaAtual> tempoMomento(int idCidade) async {
    if (_climaAtual == null) {
      final response = await http
          .get('$baseUrl/weather/locale/$idCidade/current?token=$token');

      if (response.statusCode == 200) {
        _climaAtual = ClimaAtual.fromJson(json.decode(response.body)['data']);
      } else {
        throw Exception(
            'Falha ao Buscar o Clima Atual:\n${_handlerErro(response.body)}');
      }
    }
    return _climaAtual;
  }

  static Future<List<ClimaHora>> proximasHoras(int idCidade) async {
    if (_climaHora == null) {
      final response = await http
          .get('$baseUrl/forecast/locale/$idCidade/hours/72?token=$token');

      if (response.statusCode == 200) {
        _climaHora = new List<ClimaHora>();
        DateTime now = DateTime.now();
        for (var hora in json.decode(response.body)['data']) {
          if (DateTime.parse(hora['date']).isAfter(now)) {
            _climaHora.add(ClimaHora.fromJson(hora));
          }
        }
      } else {
        throw Exception(
            'Falha ao Buscar o Clima das Próximas Horas:\n${_handlerErro(response.body)}');
      }
    }
    return _climaHora;
  }

  static Future<List<ClimaDia>> proximosDias(int idCidade) async {
    if (_climaDia == null) {
      final response = await http
          .get('$baseUrl/forecast/locale/$idCidade/days/15?token=$token');

      if (response.statusCode == 200) {
        _climaDia = new List<ClimaDia>();
        for (var dia in json.decode(response.body)['data']) {
          _climaDia.add(ClimaDia.fromJson(dia));
        }
      } else {
        throw Exception(
            'Falha ao Buscar o Clima dos Próximos Dias:\n${_handlerErro(response.body)}');
      }
    }
    return _climaDia;
  }
}
