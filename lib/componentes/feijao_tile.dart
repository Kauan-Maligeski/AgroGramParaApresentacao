

import 'package:AGROGRAM/pages/Classes/ClassesRaizes/Feijao_raiz.dart';
import 'package:AGROGRAM/provider/itens-feijao.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeijaoTile extends StatelessWidget {
final FeijaoRaiz feijao;
const FeijaoTile(this.feijao);

  @override
  Widget build(BuildContext context) {
    final avatar = FeijaoRaiz().urlProdutoFeijao==null || FeijaoRaiz().urlProdutoFeijao.isEmpty
    ?CircleAvatar(child: Icon(Icons.person),)
    :CircleAvatar(backgroundImage: NetworkImage(FeijaoRaiz().urlProdutoFeijao));
    return ListTile(
      leading: avatar,
      title: Text(feijao.nome),
      subtitle: Text(feijao.resultText),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: (){
                 Provider.of<ItensFeijao>(context, listen: false).remove(feijao);
                
              },
            )
          ],
        ),
      ),
    );
  }
}