import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          "Maxis",
          style: TextStyle(fontFamily: "Raleway", fontWeight: FontWeight.w300),
        ),
        Image.asset(
          "assets/images/maxis.png",
          width: 30,
        ),
        Text(
          "Mobile",
          style: TextStyle(fontFamily: "Raleway", fontWeight: FontWeight.w300),
        ),
      ],
    );
  }
}
