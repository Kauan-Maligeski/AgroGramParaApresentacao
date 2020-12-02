import 'package:flutter/material.dart';

class LoadingMilho extends StatelessWidget {
  var busy = false;
  Function func;
  var text = "";

  LoadingMilho({
    @required this.busy,
    @required this.func,
    @required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return
    busy ? Container(
      alignment: Alignment.center,
      height: 50,
      child: CircularProgressIndicator(

      ),
    )
    :Container(
            margin: EdgeInsets.all(30),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFF9eb647),
              borderRadius: BorderRadius.circular(60),
            ),
            child: FlatButton(
              child: Text(
                text,
               style: TextStyle(
                         fontWeight: FontWeight.bold,
                         color: Colors.white,
                         fontSize: 20,
                       ),
              ),
              onPressed: func,
            ),
          );
  }
}