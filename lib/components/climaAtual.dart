import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_weather_app/models/clima_atual_model.dart';
import 'package:flutter_weather_app/services/clima_tempo_service.dart';

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
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 150.0,
            child: Image(
              image: AssetImage('images/200px/${climaAtual.icone}.png'),
            ),
          ),
          Text(
            '${climaAtual.condicao}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      '${climaAtual.temperatura} °C',
                      style: TextStyle(
                        fontSize: 40.0,
                      ),
                    ),
                    Text('Sensação: ${climaAtual.sensacaoTermica} °C'),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            height: 40.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Vento:',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w400),
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'Vel.: ${climaAtual.ventoVelocidade} Km/h',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w200),
                        ),
                        Text(
                          'Direção.: ${climaAtual.ventoDirecao}',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w200),
                        ),
                      ],
                    )
                  ],
                ),
                Divider(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Umidade:',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      '${climaAtual.umidade} %',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w200),
                    ),
                  ],
                ),
                Divider(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Pressão:',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      '${climaAtual.pressao} hPa',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w200),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    } else if (snapshot.hasError) {
      return Text('${snapshot.error}');
    }
    return CircularProgressIndicator();
  }
}
