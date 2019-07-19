import 'package:flutter/material.dart';
import './atual_page.dart';
import './proximos_dias_page.dart';
import './proximas_horas_page.dart';
import './grafico_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  List<Widget> _paginas = [
    ClimaAtualPage(),
    ProximosDiasPage(),
    ProximasHorasPage(),
    GraficoPage(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      initialIndex: 0,
      length: _paginas.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clima Poa'),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: _paginas.map((e) => Tab(text: e.toString())).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _paginas,
      ),
    );
  }
}
