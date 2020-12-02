
import 'package:AGROGRAM/pages/Classes/ClassesRaizes/Soja_raiz.dart';
import 'package:AGROGRAM/pages/Classes/widgetsSoja/logosoja.dart';
import 'package:AGROGRAM/pages/Classes/widgetsSoja/submitSoja.dart';

import 'package:AGROGRAM/pages/Classes/widgetsSoja/sucess.dart';
import 'package:AGROGRAM/provider/itens-soja.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:provider/provider.dart';
import '../telaPrincipal.dart';

class Soja extends StatefulWidget {
  @override
  _SojaState createState() => _SojaState();
}

class _SojaState extends State<Soja> {
final _form = GlobalKey<FormState>();
final Map<String, String> _formData={};

  var _areaCtrl = new MoneyMaskedTextController();

  var _busy = false;

  var _completed = false;

  var _resultText = "";

  @override
  Widget build(BuildContext context) {
    

    return Scaffold( 
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back), 
          color: Colors.black38,
          onPressed: () => Navigator.pop(context, false), 
          ),
        title: Text("Voltar para o menu "),
      ),
      body: ListView(   
        children: <Widget>[
          Logo(),
          _completed ? SucessSoja(
            reset: save,
            result: _resultText,
            )
          :SubmitSoja(
          areaCtrl: _areaCtrl , 
          busy: _busy, 
          sumbmitSoja: calculate,
          ),

          SizedBox(
            height: 30,
          ),
          
        ],
      ),
    );
  }

  Future calculate(){
    double semente = 13;
    double veneno = 0.045;
    double adubo = 0.040;
    double area = double.parse(_areaCtrl.text.replaceAll(new RegExp(r'[,.]'),''),
    )/
    100;
    double resultQtdVeneno = area * veneno;
    double resultQtdSemente = area * semente;
    double resultQtdAdubo = area * adubo;

      setState(() {
        _completed = false;
        _busy = true;
      });

    return new Future.delayed(const Duration(seconds:3),() =>{
      setState(() {
        if(area >= 1){
        _resultText ="Quantidade de sementes/metro²: $resultQtdSemente"+
        "\nQuantide de adubo/kg: $resultQtdAdubo Kg" + 
        "\nQuantidade de veneno/litros: $resultQtdVeneno L";
      

      _busy = false;
      _completed = true;
        }else{
          reset();
        }
    })
    });  
      
  }

  reset(){
    setState(() {
      _areaCtrl = new MoneyMaskedTextController();
      _completed = false;
      _busy = false; 
    });
  }
  save(){
    setState(() {
        Provider.of<ItensSoja>(context, listen: false).put(SojaRaiz(
          id: _formData['id'],
          resultText: "$_resultText",

        ),
        );
      
      Navigator.pop(
    context,
    MaterialPageRoute(
    builder: (context) => TelaPrincipal(), 
                          
     ),
      );
    });
  }
}
