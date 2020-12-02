import 'package:AGROGRAM/pages/Classes/widgetsTrigo/loadingTrigo.dart';
import 'package:flutter/material.dart';

class SucessTrigo extends StatelessWidget {
  var result = "";
  Function reset;

  SucessTrigo({
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
               LoadingTrigo(
                func: reset,
                text: "CADASTRAR",
                busy: false,
                ),
              ],
              ),
          );
  }
}