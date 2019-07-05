import 'package:flutter/material.dart';
import 'package:flutter_charts/flutter_charts.dart';

class MyChart extends StatelessWidget {
  ChartData _chartData;
  final List<List<double>> data;
  final List<String> labels;

  MyChart({@required this.data, @required this.labels}) {
    _chartData = new ChartData()
      ..dataRowsLegends = ['Temperatura', 'Precipitação']
      ..dataRows = data
      ..xLabels = labels
      ..dataRowsColors = [
        Colors.purple,
        Colors.blueAccent
      ];
    // ..assignDataRowsDefaultColors();
  }

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      // expansion inside Column pulls contents |
      child: new Column(
        // this stretch carries | expansion to <--> Expanded children
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new Expanded(
            child: new LineChart(
              painter: new LineChartPainter(),
              container: new LineChartContainer(
                chartData: _chartData, // @required
                chartOptions: new LineChartOptions(), // @required
              ),
            ), // verticalBarChart, lineChart
          ),
          new Expanded(
            child: new VerticalBarChart(
              painter: new VerticalBarChartPainter(),
              container: new VerticalBarChartContainer(
                chartData: _chartData, // @required
                chartOptions: new VerticalBarChartOptions(), // @required
              ),
            ),
          ),
        ],
      ),
    );
  }
}
