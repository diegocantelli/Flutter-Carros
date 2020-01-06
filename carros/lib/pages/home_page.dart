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

    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: carros.length,
        itemBuilder: (context, index) {
          var c = carros[index];
          return Card(
            color: Colors.blueGrey[100],
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Image.network(
                      c.urlFoto,
                      width: 150,
                    ),
                  ),
                  Text(
                    c.nome,
                    style: TextStyle(
                      fontSize: 26,
                    ),
                  ),
                  Text(
                    c.descricao,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  ButtonTheme.bar(
                    child: ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text(
                            "Ver",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () {},
                        ),
                        FlatButton(
                          child: const Text(
                            "Salvar",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
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
