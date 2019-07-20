import 'package:flutter/material.dart';
import 'package:flutter_weather_app/components/myChart.dart';
import 'package:flutter_weather_app/models/clima_hora_model.dart';
import 'package:flutter_weather_app/services/clima_tempo_service.dart';

class ChartProximashoras extends StatefulWidget {
  @override
  _ChartProximashorasState createState() => _ChartProximashorasState();
}

class _ChartProximashorasState extends State<ChartProximashoras> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ClimaHora>>(
      future: ClimaTempo.proximasHoras(5346),
      builder: buildFutureProximasHoras,
    );
  }

  Widget buildFutureProximasHoras(
      BuildContext context, AsyncSnapshot<List<ClimaHora>> snapshot) {
    if (snapshot.hasData) {
      List<List<double>> data = [[]];
      List<String> labels = List<String>();

      snapshot.data
          .take(17)
          .toList()
          .forEach((element) {
        data[0].add(element.temperatura.toDouble());
        labels.add(element.dataBR.substring(11));
      });

      return MyChart(
        data: data,
        labels: labels,
        legends: [
          'Temperatura (°C)',
        ],
      );
    } else if (snapshot.hasError) {
      return Text('${snapshot.error}');
    }
    return CircularProgressIndicator();
  }
}
