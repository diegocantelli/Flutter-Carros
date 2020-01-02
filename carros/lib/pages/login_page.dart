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
          _text("Login", "Digite o login"),
          _text("Senha", "Digite a senha", obscurePassword: true),
          _button(textButton: "Login")
        ],
      ),
    );
  }

  _button({ @required String textButton }){
    return Container(
      height: 46,
      child: RaisedButton(
        color: Colors.blueAccent,
        child: Text(
          textButton,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20
            ),
          ),
        onPressed: (){},
      ),
    );
  }

  _text(String labelText, String hintText, { bool obscurePassword = false }){
    return TextFormField(
      obscureText: obscurePassword,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          fontSize: 16,
          color: Colors.grey
        ),
        hintText: hintText
      ),
    );
  }
}