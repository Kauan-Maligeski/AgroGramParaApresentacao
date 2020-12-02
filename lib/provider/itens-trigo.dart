import 'dart:math';

import 'package:AGROGRAM/Data/Dummy_produtos_trigo.dart';
import 'package:AGROGRAM/pages/Classes/ClassesRaizes/Trigo_raiz.dart';
import 'package:flutter/cupertino.dart';

class ItensTrigo with ChangeNotifier{
  final Map<String, TrigoRaiz> _items = {...DUMMY_PRODUTOS_TRIGO};

  List<TrigoRaiz> get all{
    return [..._items.values];
  }

  int get count{
    return _items.length;
  }

  TrigoRaiz byIndex(int i){
    return _items.values.elementAt(i);
  }

  void put(TrigoRaiz trigoRaiz ){
    if(trigoRaiz == null){
      return;
   }

   
   if (trigoRaiz.id != null && trigoRaiz.id.trim().isNotEmpty&&_items.containsKey(trigoRaiz.id)) {
      _items.update(trigoRaiz.id, (_) =>TrigoRaiz(
        id: trigoRaiz.id,
        resultText: trigoRaiz.resultText,
     ));
    }else{
     final id = Random().nextDouble().toString();
    _items.putIfAbsent(id, () => TrigoRaiz(
      id:id,
      resultText: trigoRaiz.resultText
    ),
    );
    }
    notifyListeners();
 }
  void remove(TrigoRaiz trigoRaiz){
    if(trigoRaiz != null && trigoRaiz.id != null){
      _items.remove(trigoRaiz.id);
      notifyListeners();
    }
  }
}