import 'dart:convert';
import 'package:AGROGRAM/pages/loginpage.dart';
import 'package:AGROGRAM/pages/subTelasPrincipais/orcamentopage.dart';
import 'package:AGROGRAM/pages/subTelasPrincipais/plantiopage.dart';
import 'package:AGROGRAM/pages/subTelasPrincipais/relatoriopage.dart';
import 'package:AGROGRAM/provider/itens-feijao.dart';
import 'package:AGROGRAM/provider/itens-soja.dart';
import 'package:AGROGRAM/provider/itens-trigo.dart';
import 'package:AGROGRAM/provider/itens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (ctx) => Itens(),
          
    ),
    ChangeNotifierProvider(create: (ctx) =>ItensTrigo() ,
    ),
     ChangeNotifierProvider(create: (ctx) =>ItensSoja() ,),
      ChangeNotifierProvider(create: (ctx) =>ItensFeijao() ,),
    ],
    child:MaterialApp(
          theme: ThemeData(primaryColor: Colors.white),
        title: "Menu",
        home: MyStatefulWidget(),
      ), 
    );
   
  }
}


 
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);
  @override
  _MyStatefulWidgetState createState()  => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>{
  int _selectedIndex =0;
   
  final List<Widget> _children=[
    Plantio(),
    Relatorio(),
    Orcamento(),
  ];
  
  

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  
  
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text(
                    "Kauan",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    ),
                  accountEmail: Text(
                    "kauanrodrigo2003@gmail.com", 
                    style: TextStyle(
                      fontSize: 15
                      ),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                    ? Colors.green: Color(0xFF9eb647),
                    child: Text("K", style: 
                    TextStyle(fontSize: 40.0, color:Colors.white ),
                  ),
                ),
              ),
            ],
          ),
            ),
            ListTile(
               leading: Icon(Icons.account_circle),
                 title: Text("Perfil"),
                 subtitle: Text("Perfil do usuário..."),
                 trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  
                }
            ),
            ListTile(
              leading: Icon(Icons.settings),
                title: Text("Ajustes"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  debugPrint('toquei no drawer');
                }
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
                 title: Text("Sobre"),
                 trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.pop(context);
                }
            ),
            ListTile(
              leading: Icon(Icons.outbond),
                 title: Text("Sair"),
                 trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(
                        context,
                        MaterialPageRoute(
                           builder:(context) => LoginPage(), 
                      ),
                      );
                }
            ),
          ],
        ),
      ) ,
      appBar: AppBar(
        backgroundColor:  Color(0xFF9eb647),
        title: Text(
          'AgroGram'
          ),
      ),
      body: Center(
        child: _children.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF9eb647) ,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.grass_rounded),
            label: 'Plantio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Relatório',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Orçamentos',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}