import 'package:carros/pages/app_drawer.dart';
import 'package:carros/pages/carros_api.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: _body(),
      drawer: AppDrawer(),
    );
  }

  _body() {
    var carros = CarrosApi.getCarros();

    return ListView.builder(
      itemCount: carros.length,
      itemBuilder: (context, index) {
        var c = carros[index];
        return Row(
          children: <Widget>[
            Image.network(
              c.urlFoto,
              width: 150,
            ),
            Flexible(
              child: Text(
                c.nome,
                style: TextStyle(
                  fontSize: 26,
                ),
              ),
            )
          ],
        );
      },
    );

    // return Container(
    //   width: double.infinity,
    //   child: Center(
    //     child: Text(
    //       "Diego",
    //       style: TextStyle(
    //         fontSize: 20,
    //       ),
    //     ),
    //   ),
    // );
  }
}
