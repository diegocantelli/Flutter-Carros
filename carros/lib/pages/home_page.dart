import 'package:carros/pages/app_drawer.dart';
import 'package:carros/pages/carro.dart';
import 'package:carros/pages/carros_api.dart';
import 'package:carros/pages/carros_listview.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Carros"),
          bottom: TabBar(
            tabs: <Widget>[
              Text(
                "Clássicos",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                "Esportivos",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                "Luxo",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CarrosListView(),
            CarrosListView(),
            CarrosListView(),
          ],
        ),
        drawer: AppDrawer(),
      ),
    );
  }
}
