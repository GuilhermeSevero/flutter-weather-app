class ClimaAtual {
  final num temperature;
  final String windDirection;
  final num windVelocity;
  final num humidity;
  final String condition;
  final num pressure;
  final String icon;
  final num sensation;

  ClimaAtual({
    this.temperature,
    this.windDirection,
    this.windVelocity,
    this.humidity,
    this.condition,
    this.pressure,
    this.icon,
    this.sensation,
  });

  factory ClimaAtual.fromJson(Map<String, dynamic> json) {
    return ClimaAtual(
      temperature: json['temperature'],
      windDirection: json['wind_direction'],
      windVelocity: json['wind_velocity'],
      humidity: json['humidity'],
      condition: json['condition'],
      pressure: json['pressure'],
      icon: json['icon'],
      sensation: json['sensation'],
    );
  }
}

class ClimaHora {
  final String date;
  final String dateBR;
  final num temperature;
  final String windDirection;
  final num windVelocity;
  final num precipitation;

  ClimaHora({
    this.date,
    this.dateBR,
    this.temperature,
    this.windDirection,
    this.windVelocity,
    this.precipitation,
  });

  factory ClimaHora.fromJson(Map<String, dynamic> json) {
    return ClimaHora(
      date: json['date'],
      dateBR: json['date_br'],
      temperature: json['temperature']['temperature'],
      windDirection: json['wind']['direction'],
      windVelocity: json['wind']['velocity'],
      precipitation: json['rain']['precipitation'],
    );
  }
}
