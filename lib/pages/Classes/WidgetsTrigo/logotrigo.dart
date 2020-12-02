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
            "assets/trigoLogo.jpeg",
            height: 80,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Trigo selecionado",
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