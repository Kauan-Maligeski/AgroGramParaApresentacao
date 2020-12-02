import 'package:AGROGRAM/componentes/feijao_tile.dart';
import 'package:AGROGRAM/componentes/milho_tile.dart';
import 'package:AGROGRAM/componentes/soja_tile.dart';
import 'package:AGROGRAM/componentes/trigo_tile.dart';
import 'package:AGROGRAM/provider/itens-feijao.dart';
import 'package:AGROGRAM/provider/itens-soja.dart';
import 'package:AGROGRAM/provider/itens-trigo.dart';
import 'package:AGROGRAM/provider/itens.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Orcamento extends StatefulWidget{
  @override
  _Orcamento createState() =>_Orcamento ();
}

class _Orcamento extends State<Orcamento> {
  @override
  Widget build(BuildContext context) {
    final feijao = Provider.of<ItensFeijao>(context);
  final soja = Provider.of<ItensSoja>(context);
  final milho = Provider.of<Itens>(context);
  final trigo = Provider.of<ItensTrigo>(context);
  return Scaffold(
      body: ListView.builder(
        itemCount: milho.count,
        
        itemBuilder: (ctx, i) => MilhoTile(milho.byIndex(i)),
        
        
      ),
      
    );
    // ignore: dead_code
    return Scaffold(
      body: ListView.builder(
        itemCount: trigo.count,
        
        itemBuilder: (ctx, i) => TrigoTile(trigo.byIndex(i)),
        
      ),
      
    );
    return Scaffold(
      body: ListView.builder(
        itemCount: soja.count,
        
        itemBuilder: (ctx, i) => SojaTile(soja.byIndex(i)),
        
      ),
      
    );
     return Scaffold(
      body: ListView.builder(
        itemCount: feijao.count,
        
        itemBuilder: (ctx, i) => FeijaoTile(feijao.byIndex(i)),
        
      ),
      
    );
    
}


}



