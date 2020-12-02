import 'dart:math';

import 'package:AGROGRAM/Data/Dummy_produtos.dart';
import 'package:AGROGRAM/pages/Classes/ClassesRaizes/Milho_raiz.dart';
import 'package:flutter/cupertino.dart';

class Itens with ChangeNotifier{
  final Map<String, MilhoRaiz> _items = {...DUMMY_PRODUTOS_MILHO};

  List<MilhoRaiz> get all{
    return [..._items.values];
  }

  int get count{
    return _items.length;
  }

  MilhoRaiz byIndex(int i){
    return _items.values.elementAt(i);
  }

  void put(MilhoRaiz milhoRaiz ){
    if(milhoRaiz == null){
      return;
   }

   
   if (milhoRaiz.id != null && milhoRaiz.id.trim().isNotEmpty&&_items.containsKey(milhoRaiz.id)) {
      _items.update(milhoRaiz.id, (_) =>MilhoRaiz(
        id: milhoRaiz.id,
        resultText: milhoRaiz.resultText,
     ));
    }else{
     final id = Random().nextDouble().toString();
    _items.putIfAbsent(id, () => MilhoRaiz(
      id:id,
      resultText: milhoRaiz.resultText
    ),
    );
    }
    notifyListeners();
 }
  void remove(MilhoRaiz milhoRaiz){
    if(milhoRaiz != null && milhoRaiz.id != null){
      _items.remove(milhoRaiz.id);
      notifyListeners();
    }
  }
}