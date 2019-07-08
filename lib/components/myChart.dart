import 'package:flutter/material.dart';
import 'package:flutter_charts/flutter_charts.dart';

class MyChart extends StatelessWidget {
  ChartData _chartData;
  final List<List<double>> data;
  final List<String> labels;
  final List<String> legends;

  MyChart({@required this.data, @required this.labels, @required this.legends}) {
    _chartData = ChartData()
      ..dataRowsLegends = legends
      ..dataRows = data
      ..xLabels = labels
      // ..dataRowsColors = [
      //   Colors.purple,
      //   Colors.blueAccent,
      //   Colors.amber
      // ];
      ..assignDataRowsDefaultColors();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // expansion inside Column pulls contents |
      child: Column(
        // this stretch carries | expansion to <--> Expanded children
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: LineChart(
              painter: LineChartPainter(),
              container: LineChartContainer(
                chartData: _chartData, // @required
                chartOptions: LineChartOptions(), // @required
              ),
            ), // verticalBarChart, lineChart
          ),
          // Expanded(
          //   child: VerticalBarChart(
          //     painter: VerticalBarChartPainter(),
          //     container: VerticalBarChartContainer(
          //       chartData: _chartData, // @required
          //       chartOptions: VerticalBarChartOptions(), // @required
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
