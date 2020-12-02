import 'dart:math';

import 'package:AGROGRAM/Data/Dummy_produtos_soja.dart';

import 'package:AGROGRAM/pages/Classes/ClassesRaizes/Soja_raiz.dart';
import 'package:flutter/cupertino.dart';

class ItensSoja with ChangeNotifier{
  final Map<String, SojaRaiz> _items = {...DUMMY_PRODUTOS_SOJA};

  List<SojaRaiz> get all{
    return [..._items.values];
  }

  int get count{
    return _items.length;
  }

  SojaRaiz byIndex(int i){
    return _items.values.elementAt(i);
  }

  void put(SojaRaiz sojaRaiz ){
    if(sojaRaiz == null){
      return;
   }

   
   if (sojaRaiz.id != null && sojaRaiz.id.trim().isNotEmpty&&_items.containsKey(sojaRaiz.id)) {
      _items.update(sojaRaiz.id, (_) =>SojaRaiz(
        id: sojaRaiz.id,
        resultText: sojaRaiz.resultText,
     ));
    }else{
     final id = Random().nextDouble().toString();
    _items.putIfAbsent(id, () => SojaRaiz(
      id:id,
      resultText: sojaRaiz.resultText
    ),
    );
    }
    notifyListeners();
 }
  void remove(SojaRaiz trigoRaiz){
    if(trigoRaiz != null && trigoRaiz.id != null){
      _items.remove(trigoRaiz.id);
      notifyListeners();
    }
  }
}