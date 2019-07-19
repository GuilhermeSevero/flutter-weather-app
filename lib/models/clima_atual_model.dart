class ClimaAtual {
  final String data;
  final num temperatura;
  final String ventoDirecao;
  final num ventoVelocidade;
  final num umidade;
  final String condicao;
  final num pressao;
  final String icone;
  final num sensacaoTermica;

  ClimaAtual({
    this.data,
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
      data: json['date'],
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
