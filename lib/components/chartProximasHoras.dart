import 'package:flutter/material.dart';
import 'package:flutter_weather_app/components/myChart.dart';
import 'package:flutter_weather_app/models/climaTempo.dart';
import 'package:flutter_weather_app/services/climaTempo.dart';

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
      List<List<double>> data = [[], []];
      List<String> labels = List<String>();

      snapshot.data
          .where(
              (element) => DateTime.parse(element.data).isAfter(DateTime.now()))
          .take(12)
          .toList()
          .forEach((element) {
        data[0].add(element.temperatura.toDouble());
        data[1].add(element.precipitacao.toDouble());
        labels.add(element.dataBR.substring(11));
      });

      return MyChart(
        data: data,
        labels: labels,
        legends: [
          'Temperatura (°C)',
          'Precipitação (mm)',
        ],
      );
    } else if (snapshot.hasError) {
      return Text("${snapshot.error}");
    }
    return CircularProgressIndicator();
  }
}