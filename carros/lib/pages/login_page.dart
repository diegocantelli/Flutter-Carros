import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();
 // const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
      ),
      body: _body()
    );
  }
 
  Container _body(){
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: <Widget>[
          _text(controller: _tLogin, labelText: "Login", hintText: "Digite o login"),
          _text(controller: _tSenha, labelText: "Senha", hintText: "Digite senha"),
          _button(textButton: "Login", onpressed: _onClickLogin)
        ],
      ),
    );
  }

  _button({ @required String textButton, @required Function onpressed }){
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
        onPressed: onpressed,
      ),
    );
  }

  _text({ @required TextEditingController controller, String labelText, String hintText, bool obscurePassword = false }){
    return TextFormField(
      controller: controller,
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

  _onClickLogin(){
    String login = _tLogin.text;
    String senha = _tSenha.text;

    print("Login: $login, Senha: $senha");
  }
}