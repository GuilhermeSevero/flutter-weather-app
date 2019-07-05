import 'package:flutter/material.dart';
import 'models/climaTempo.dart';
import 'services/climaTempo.dart';
import 'components/myChart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Clima Poa',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: new MyHomePage(title: 'Clima Poa'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

/// State of the page.
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  Widget buildFuture(
      BuildContext context, AsyncSnapshot<List<ClimaHora>> snapshot) {
    if (snapshot.hasData) {
      List<ClimaHora> filtrados = snapshot.data
          .where(
              (element) => DateTime.parse(element.data).isAfter(DateTime.now()))
          .take(15)
          .toList();

      return new MyChart(
        data: [
          filtrados
              .map((ClimaHora element) => element.temperatura.toDouble())
              .toList(),
          filtrados
              .map((ClimaHora element) => element.precipitacao.toDouble())
              .toList(),
        ],
        labels: filtrados.map((ClimaHora element) => element.dataBR).toList(),
      );
    } else if (snapshot.hasError) {
      return Text("${snapshot.error}");
    }
    return CircularProgressIndicator();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<List<ClimaHora>>(
              future: ClimaTempo.proximasHoras(5346),
              builder: buildFuture,
            ),
          ],
        ),
      ),
    );
  }
}
