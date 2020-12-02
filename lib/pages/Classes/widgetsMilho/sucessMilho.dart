import 'package:flutter/material.dart';

import 'loadingMilho.dart';

class SucessMilho extends StatelessWidget {
  var result = "";
  Function reset;

  SucessMilho({
    @required this.result,
    @required this.reset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
            margin: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children:<Widget> [
                SizedBox(
                  height:50,
                ),
                Text(
                  result,
                  style: TextStyle(
                    
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
               LoadingMilho(
                func: reset,
                text: "CADASTRAR",
                busy: false,
                ),
              ],
              ),
          );
  }
}