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
