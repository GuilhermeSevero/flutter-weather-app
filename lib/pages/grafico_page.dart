import 'package:flutter/material.dart';
import '../components/chartProximasHoras.dart';

class GraficoPage extends StatefulWidget {
  @override
  _GraficoPageState createState() => _GraficoPageState();
  
  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    return 'GRÁFICO';
  }
}

class _GraficoPageState extends State<GraficoPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ChartProximashoras(),
        ],
      ),
    );
  }
}