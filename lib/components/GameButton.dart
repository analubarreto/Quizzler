import 'package:flutter/material.dart';

class GameButton extends StatelessWidget {
  const GameButton({ this.trueIcon, this.falseIcon, this.onPress, this.btnText, this.btnColor });

  final Widget trueIcon;
  final Widget falseIcon;
  final Function onPress;
  final String btnText;
  final Color btnColor;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      textColor: Colors.white,
      color: btnColor,
      child: Text(
        btnText,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
        ),
      ),
      onPressed: onPress
    );
  }
}