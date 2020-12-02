
import 'package:AGROGRAM/pages/Classes/ClassesRaizes/Trigo_raiz.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:AGROGRAM/provider/itens-trigo.dart';

class TrigoTile extends StatelessWidget {
final TrigoRaiz trigo;
const TrigoTile(this.trigo);

  @override
  Widget build(BuildContext context) {
    final avatar = TrigoRaiz().urlProdutoTrigo ==null || TrigoRaiz().urlProdutoTrigo.isEmpty
    ?CircleAvatar(child: Icon(Icons.person),)
    :CircleAvatar(backgroundImage: NetworkImage(TrigoRaiz().urlProdutoTrigo));
    return ListTile(
      leading: avatar,
      title: Text(trigo.nome),
      subtitle: Text(trigo.resultText),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: (){
                 Provider.of<ItensTrigo>(context, listen: false).remove(trigo);
                
              },
            )
          ],
        ),
      ),
    );
  }
}