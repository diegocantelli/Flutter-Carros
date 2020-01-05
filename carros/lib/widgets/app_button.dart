import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  String textButton;
  bool showProgress;

  Function onpressed;

  AppButton(this.textButton, {this.onpressed, this.showProgress = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      child: RaisedButton(
        color: Colors.blueAccent,
        child: showProgress
            ? CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              )
            : Text(
                textButton,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
        onPressed: onpressed,
      ),
    );
  }
}
