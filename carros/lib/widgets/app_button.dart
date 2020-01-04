import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  String textButton;

  Function onpressed;

  AppButton(this.textButton, {this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      child: RaisedButton(
        color: Colors.blueAccent,
        child: Text(
          textButton,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: onpressed,
      ),
    );
  }
}
