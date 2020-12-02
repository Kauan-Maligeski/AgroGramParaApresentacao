import 'dart:math';

import 'package:AGROGRAM/Data/Dummy_produtos_feijao.dart';
import 'package:AGROGRAM/pages/Classes/ClassesRaizes/Feijao_raiz.dart';
import 'package:flutter/cupertino.dart';

class ItensFeijao with ChangeNotifier{
  final Map<String, FeijaoRaiz> _items = {...DUMMY_PRODUTOS_FEIJAO};

  List<FeijaoRaiz> get all{
    return [..._items.values];
  }

  int get count{
    return _items.length;
  }

  FeijaoRaiz byIndex(int i){
    return _items.values.elementAt(i);
  }

  void put(FeijaoRaiz feijaoRaiz ){
    if(feijaoRaiz == null){
      return;
   }

   
   if (feijaoRaiz.id != null && feijaoRaiz.id.trim().isNotEmpty&&_items.containsKey(feijaoRaiz.id)) {
      _items.update(feijaoRaiz.id, (_) =>FeijaoRaiz(
        id: feijaoRaiz.id,
        resultText: feijaoRaiz.resultText,
     ));
    }else{
     final id = Random().nextDouble().toString();
    _items.putIfAbsent(id, () => FeijaoRaiz(
      id:id,
      resultText: feijaoRaiz.resultText
    ),
    );
    }
    notifyListeners();
 }
  void remove(FeijaoRaiz feijaoRaiz){
    if(feijaoRaiz != null && feijaoRaiz.id != null){
      _items.remove(feijaoRaiz.id);
      notifyListeners();
    }
  }
}