

import 'package:AGROGRAM/pages/Classes/ClassesRaizes/Milho_raiz.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:AGROGRAM/provider/itens.dart';

class MilhoTile extends StatelessWidget {
final MilhoRaiz milho;
const MilhoTile(this.milho);

  @override
  Widget build(BuildContext context) {
    final avatar = MilhoRaiz().urlProdutoMilho ==null || MilhoRaiz().urlProdutoMilho.isEmpty
    ?CircleAvatar(child: Icon(Icons.person),)
    :CircleAvatar(backgroundImage: NetworkImage(MilhoRaiz().urlProdutoMilho));
    return ListTile(
      leading: avatar,
      title: Text(milho.nome),
      subtitle: Text(milho.resultText),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: (){
                 Provider.of<Itens>(context, listen: false).remove(milho);
                
              },
            )
          ],
        ),
      ),
    );
  }
}