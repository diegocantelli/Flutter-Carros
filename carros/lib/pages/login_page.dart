import 'package:carros/pages/home_page.dart';
import 'package:carros/pages/login_api.dart';
import 'package:carros/widgets/app_button.dart';
import 'package:carros/widgets/app_text.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _tLogin = TextEditingController();

  final _tSenha = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final _focusSenha = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Carros"),
        ),
        body: _body());
  }

  _body() {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            AppText(
              controller: _tLogin,
              validator: validateLogin,
              labelText: "Login",
              hintText: "Digite o login",
            ),
            AppText(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              obscurePassword: true,
              focusNode: _focusSenha,
              onFieldSubmitted: (String text) {
                Focus.of(context).requestFocus(_focusSenha);
              },
              controller: _tSenha,
              validator: validateSenha,
              labelText: "Senha",
              hintText: "Digite senha",
            ),
            AppButton(
              "Login",
              onpressed: _onClickLogin,
            )
          ],
        ),
      ),
    );
  }

  _onClickLogin() async {
    bool formOk = _formKey.currentState.validate();

    if (!formOk) {
      return;
    }

    bool ok = await LoginApi.login(_tLogin.text, _tSenha.text);

    if (ok) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (BuildContext context) {
          return HomePage();
        }),
      );
    }
  }

  String validateLogin(String text) {
    if (text.isEmpty) {
      return "Digite o login";
    }
    return null;
  }

  String validateSenha(String text) {
    if (text.isEmpty) {
      return "Digite a senha";
    }

    if (text.length < 3) {
      return "A senha precisa ter no mínimo três números.";
    }

    return null;
  }
}
