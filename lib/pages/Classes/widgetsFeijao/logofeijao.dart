import 'package:flutter/cupertino.dart';


class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
            height: 60,
          ),
          Image.asset(
            "assets/feijaoLogo.jpeg",
            height: 80,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Feijão selecionado",
            style: TextStyle(
              fontSize:25,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
      ],
    );
  }
}