class ClimaAtual {
  final num temperatura;
  final String ventoDirecao;
  final num ventoVelocidade;
  final num umidade;
  final String condicao;
  final num pressao;
  final String icone;
  final num sensacaoTermica;

  ClimaAtual({
    this.temperatura,
    this.ventoDirecao,
    this.ventoVelocidade,
    this.umidade,
    this.condicao,
    this.pressao,
    this.icone,
    this.sensacaoTermica,
  });

  factory ClimaAtual.fromJson(Map<String, dynamic> json) {
    return ClimaAtual(
      temperatura: json['temperature'],
      ventoDirecao: json['wind_direction'],
      ventoVelocidade: json['wind_velocity'],
      umidade: json['humidity'],
      condicao: json['condition'],
      pressao: json['pressure'],
      icone: json['icon'],
      sensacaoTermica: json['sensation'],
    );
  }
}

class ClimaHora {
  final String data;
  final String dataBR;
  final num temperatura;
  final String ventoDirecao;
  final num ventoVelocidade;
  final num precipitacao;

  ClimaHora({
    this.data,
    this.dataBR,
    this.temperatura,
    this.ventoDirecao,
    this.ventoVelocidade,
    this.precipitacao,
  });

  factory ClimaHora.fromJson(Map<String, dynamic> json) {
    return ClimaHora(
      data: json['date'],
      dataBR: json['date_br'],
      temperatura: json['temperature']['temperature'],
      ventoDirecao: json['wind']['direction'],
      ventoVelocidade: json['wind']['velocity'],
      precipitacao: json['rain']['precipitation'],
    );
  }
}
