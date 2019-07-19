class ClimaDia {
  final String data;
  final String dataBR;
  final Chuva chuva;
  final MinMax sencacaoTermica;
  final TextoIcone texto;
  final TextoIcone icone;
  final Temperatura temperatura;

  ClimaDia({
    this.data,
    this.dataBR,
    this.chuva,
    this.sencacaoTermica,
    this.texto,
    this.icone,
    this.temperatura,
  });

  factory ClimaDia.fromJson(Map<String, dynamic> json) {
    return ClimaDia(
      chuva: Chuva(
        precipitacao: json['rain']['precipitation'],
        probabilidade: json['rain']['probability'],
      ),
      data: json['date'],
      dataBR: json['date_br'],
      texto: TextoIcone(
        madrugada: json['text_icon']['text']['phrase']['dawn'],
        manha: json['text_icon']['text']['phrase']['morning'],
        dia: json['text_icon']['text']['phrase']['reduced'],
        tarde: json['text_icon']['text']['phrase']['afternoon'],
        noite: json['text_icon']['text']['phrase']['night'],
      ),
      icone: TextoIcone(
        madrugada: json['text_icon']['icon']['dawn'],
        manha: json['text_icon']['icon']['morning'],
        dia: json['text_icon']['icon']['day'],
        tarde: json['text_icon']['icon']['afternoon'],
        noite: json['text_icon']['icon']['night'],
      ),
      sencacaoTermica: MinMax(
        json['thermal_sensation']['min'],
        json['thermal_sensation']['max'],
      ),
      temperatura: Temperatura(
        madrugada: MinMax(
          json['temperature']['dawn']['min'],
          json['temperature']['dawn']['max'],
        ),
        manha: MinMax(
          json['temperature']['morning']['min'],
          json['temperature']['morning']['max'],
        ),
        max: json['temperature']['max'],
        min: json['temperature']['min'],
        noite: MinMax(
          json['temperature']['night']['min'],
          json['temperature']['night']['max'],
        ),
        tarde: MinMax(
          json['temperature']['afternoon']['min'],
          json['temperature']['afternoon']['max'],
        ),
      ),
    );
  }
}

class MinMax {
  final num min;
  final num max;

  MinMax(this.min, this.max);
}

class Chuva {
  final num probabilidade;
  final num precipitacao;

  Chuva({
    this.probabilidade,
    this.precipitacao,
  });
}

class Temperatura extends MinMax {
  final MinMax madrugada;
  final MinMax manha;
  final MinMax tarde;
  final MinMax noite;

  Temperatura({
    min = 0,
    max = 0,
    this.madrugada,
    this.manha,
    this.tarde,
    this.noite,
  }) : super(min, max);
}

class TextoIcone {
  final String madrugada;
  final String manha;
  final String dia;
  final String tarde;
  final String noite;

  TextoIcone({
    this.madrugada,
    this.manha,
    this.dia,
    this.tarde,
    this.noite,
  });
}
