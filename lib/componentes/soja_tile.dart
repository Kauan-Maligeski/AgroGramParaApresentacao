

import 'package:AGROGRAM/pages/Classes/ClassesRaizes/Soja_raiz.dart';
import 'package:AGROGRAM/provider/itens-soja.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SojaTile extends StatelessWidget {
final SojaRaiz soja;
const SojaTile(this.soja);

  @override
  Widget build(BuildContext context) {
    final avatar = SojaRaiz().urlProdutoSoja ==null || SojaRaiz().urlProdutoSoja.isEmpty
    ?CircleAvatar(child: Icon(Icons.person),)
    :CircleAvatar(backgroundImage: NetworkImage(SojaRaiz().urlProdutoSoja));
    return ListTile(
      leading: avatar,
      title: Text(soja.nome),
      subtitle: Text(soja.resultText),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: (){
                 Provider.of<ItensSoja>(context, listen: false).remove(soja);
                
              },
            )
          ],
        ),
      ),
    );
  }
}