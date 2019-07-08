import 'package:flutter/material.dart';
import 'package:flutter_weather_app/models/climaTempo.dart';
import 'package:flutter_weather_app/services/climaTempo.dart';

class ClimaAtualWidget extends StatefulWidget {
  @override
  _ClimaAtualWidgetState createState() => _ClimaAtualWidgetState();
}

class _ClimaAtualWidgetState extends State<ClimaAtualWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ClimaAtual>(
      future: ClimaTempo.tempoMomento(5346),
      builder: buildFutureTempoMomento,
    );
  }

  Widget buildFutureTempoMomento(
      BuildContext context, AsyncSnapshot<ClimaAtual> snapshot) {
    if (snapshot.hasData) {
      ClimaAtual climaAtual = snapshot.data;
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Image(
            image: AssetImage('images/128px/${climaAtual.icone}.png'),
          ),
          Column(
            children: <Widget>[
              Text(
                '${climaAtual.temperatura} °C',
                style: TextStyle(
                  fontSize: 40.0,
                ),
              ),
              Text('Sensação: ${climaAtual.sensacaoTermica} °C'),
              Text('${climaAtual.condicao}'),
            ],
          ),
        ],
      );
    } else if (snapshot.hasError) {
      return Text("${snapshot.error}");
    }
    return CircularProgressIndicator();
  }
}
