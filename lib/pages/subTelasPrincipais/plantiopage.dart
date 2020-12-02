import 'package:AGROGRAM/pages/Classes/Feijao.dart';
import 'package:AGROGRAM/pages/Classes/Milho.dart';
import 'package:AGROGRAM/pages/Classes/soja.dart';

import 'package:AGROGRAM/pages/Classes/trigo.dart';
import 'package:flutter/material.dart';


class Plantio extends StatefulWidget{
  @override
  _Plantio createState() =>_Plantio ();
}


class _Plantio extends State<Plantio>{
  @override
  Widget build(BuildContext context) {
  return Center(
    child: Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,        
        children: <Widget>[
          const ListTile(        
            leading: Icon(Icons.grain),
            title: Text('Milho'),
            subtitle: Text('O tempo de sua permanência no campo até o momento da colheita é de aproximadamente 90 dias no verão e de 100 dias no inverno.'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('PLANTAR'),
                  onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Milho(),       
                        ),
                      );
                    },
              
              ),
              const SizedBox(width: 8),
             
            ],
          ),
          const ListTile(
            leading: Icon(Icons.grain),
            title: Text('Trigo'),
            subtitle: Text('Após 110 a 120 dias do plantio a colheita já pode ser feita.'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('PLANTAR'),
                onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Trigo(),
                          
                        ),
                      );
                    },
              ),
              const SizedBox(width: 8),
              
            ],
          ),
          const ListTile(
            leading: Icon(Icons.grain),
            title: Text('Soja'),
            subtitle: Text('60 a 120 dias o tempo de colheita, de acordo com as características da região, o produtor pode selecionar uma variedade mais tardia ou precoce para ter as melhores condições climáticas em seu ciclo.'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('PLANTAR'),
                onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                         builder: (context) => Soja(),
                          
                        ),
                      );
                    },
              ),
              const SizedBox(width: 8),
             
            ],
          ),
          const ListTile(
            leading: Icon(Icons.grain),
            title: Text('Feijão'),
            subtitle: Text('A colheita pode ser feita manualmente ou através do maquinário adequado quando as vagens do feijão estiverem secas ou começando a secar. Isso ocorre cerca de 80 a 100 dias após a germinação.'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('PLANTAR'),
               onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Feijao(),                      
                        ),
                      );
                    },
              ),
              const SizedBox(width: 8),
              
            ],
          ),
          
        ],
        
      ),
    ),
  );
}

}