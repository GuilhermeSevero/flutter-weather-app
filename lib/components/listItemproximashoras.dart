import 'package:flutter/material.dart';
import '../models/clima_hora_model.dart';

class ListItemProximasHoras extends StatelessWidget {
  final BuildContext context;
  final ClimaHora climaHora;

  ListItemProximasHoras({this.context, this.climaHora});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Divider(
          height: 10.0,
        ),
        ListTile(
          leading: CircleAvatar(
            foregroundColor: Theme.of(context).primaryColor,
            backgroundColor: Colors.white,
            radius: 25.0,
            child: Text(
              '${climaHora.temperatura} ºC',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Chuva: ${climaHora.precipitacao} mm',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '${climaHora.dataBR}',
                style: TextStyle(color: Colors.grey, fontSize: 14.0),
              ),
            ],
          ),
          subtitle: Container(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              'Vento: ${climaHora.ventoDirecao} - ${climaHora.ventoVelocidade} Km/h',
              style: TextStyle(color: Colors.grey, fontSize: 15.0),
            ),
          ),
        ),
      ],
    );
  }
}
