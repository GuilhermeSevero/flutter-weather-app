import 'package:flutter/material.dart';
import '../models/clima_dia_model.dart';

class ListItemProximosDias extends StatelessWidget {
  final BuildContext context;
  final ClimaDia climaDia;

  ListItemProximosDias({this.context, this.climaDia});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Divider(
          height: 10.0,
        ),
        ListTile(
          isThreeLine: true,
          leading: CircleAvatar(
            foregroundColor: Theme.of(context).primaryColor,
            backgroundColor: Colors.transparent,
            radius: 25.0,
            child: Image(
              image: AssetImage('images/45px/${climaDia.icone.dia}.png'),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '${climaDia.temperatura.min}/${climaDia.temperatura.max} ºC',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '${climaDia.dataBR}',
                style: TextStyle(color: Colors.grey, fontSize: 14.0),
              ),
            ],
          ),
          subtitle: Container(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              '${climaDia.texto.dia}',
              style: TextStyle(color: Colors.grey, fontSize: 15.0),
            ),
          ),
        ),
      ],
    );
  }
}
