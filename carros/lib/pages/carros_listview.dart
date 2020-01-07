import 'package:carros/pages/carro.dart';
import 'package:carros/pages/carros_api.dart';
import 'package:flutter/material.dart';

class CarrosListView extends StatelessWidget {
  const CarrosListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _body();
  }

  _body() {
    var carrosFuture = CarrosApi.getCarros();

    return FutureBuilder(
      future: carrosFuture,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              "Não foi possível carregar a lista de carros",
              style: TextStyle(color: Colors.redAccent),
            ),
          );
        }
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        var carros = snapshot.data;
        return _listView(carros);
      },
    );
  }

  _listView(List<Carro> carros) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: carros != null ? carros.length : 0,
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
                      c.urlFoto ??
                          'http://www.livroandroid.com.br/livro/carros/classicos/Dodge_Challenger.png',
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
  }
}
