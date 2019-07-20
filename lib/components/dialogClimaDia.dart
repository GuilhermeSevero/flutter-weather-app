import 'package:flutter/material.dart';
import 'package:flutter_weather_app/models/clima_dia_model.dart';

class DialogClimaDia extends StatelessWidget {
  final ClimaDia climaDia;

  DialogClimaDia(this.climaDia);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Detalhes do dia - ${climaDia.dataBR}'),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _getItem(
                descricao: 'Madrugada',
                icone: climaDia.icone.madrugada,
                temperatura: climaDia.temperatura.madrugada),
            _getItem(
                descricao: 'Manhã',
                icone: climaDia.icone.manha,
                temperatura: climaDia.temperatura.manha),
            _getItem(
                descricao: 'Tarde',
                icone: climaDia.icone.tarde,
                temperatura: climaDia.temperatura.tarde),
            _getItem(
                descricao: 'Noite',
                icone: climaDia.icone.noite,
                temperatura: climaDia.temperatura.noite),
            Divider(
              height: 10.0,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
          child: Text('Voltar', style: TextStyle(fontSize: 18.0),),
        ),
      ],
    );
  }

  Widget _getItem({String descricao, String icone, MinMax temperatura}) {
    return Column(
      children: <Widget>[
        Divider(
          height: 30.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              descricao,
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            Column(
              children: <Widget>[
                Container(
                  height: 45.0,
                  child: Image(
                    image: AssetImage('images/45px/$icone.png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    '${temperatura.min}º/${temperatura.max}º',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
