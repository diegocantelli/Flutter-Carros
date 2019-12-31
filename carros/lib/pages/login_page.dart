import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
      ),
      body: _body()
    );
  }

  _body(){
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: <Widget>[
          Text("Login"),
          TextFormField(),
          Text("Senha"),
          TextFormField(obscureText: true,),
          Container(
            height: 46,
            child: RaisedButton(
              color: Colors.blueAccent,
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
                  ),
                ),
              onPressed: (){},
            ),
          )
        ],
      ),
    );
  }
}