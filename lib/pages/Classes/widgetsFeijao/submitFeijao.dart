import 'package:AGROGRAM/pages/Classes/widgetsFeijao/loadingFeijao.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import 'input.widget.feijao.dart';
import 'loadingFeijao.dart';

class SubmitFeijao extends StatelessWidget {
  var areaCtrl = new MoneyMaskedTextController();
  var busy = false;
  Function sumbmitFeijao;

  SubmitFeijao({
    @required this.areaCtrl,
    @required this.busy,
    @required this.sumbmitFeijao, Future Function(),
  });
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child:Input(
            ctrl: areaCtrl,
            label: "Área:",
          ),
        ),

        SizedBox(
          height: 25,
        ),

        LoadingFeijao(
            func: sumbmitFeijao,
            text: "CALCULAR",
            busy: busy,
            ),
      ],
    );
  }
}