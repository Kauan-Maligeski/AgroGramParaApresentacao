import 'dart:html';

import 'package:AGROGRAM/pages/Classes/Milho.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;


class Relatorio extends StatefulWidget{
  @override
  _Relatorio createState() =>_Relatorio ();
}
class _Relatorio extends State<Relatorio> {
  final double _borderRadius= 24;
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          
          children:<Widget> [
            
            Container(
               child: InkWell(
                 onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Milho(),
                          
                        ),
                      );
                    },
               ),
              height: 150,
              decoration: BoxDecoration(
                
                borderRadius: BorderRadius.circular(_borderRadius),
                gradient: LinearGradient(
                  colors: [Colors.greenAccent, Colors.white],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
                ),
                
                boxShadow:[ BoxShadow(
                
                  color: Colors.greenAccent,
                  blurRadius: 12,
                  offset: Offset(0,6),
                ),
                ],
              color: Colors.greenAccent,
              ),
            ),
            
            Positioned(
              right: 0,
              bottom: 0,
              top: 0,
              child: CustomPaint(
              size: Size(100,150),
              painter: CustumCardShapePainter(_borderRadius, Colors.greenAccent, Colors.green), 
              ),
            ),
            Positioned.fill(
              
              child: Row(
                children: <Widget>[
                  Expanded(child: Image.asset('assets/logotipo.png', height: 64, width: 64,),
                  
                  flex: 2,
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      
                      children: <Widget> [
                        Text(
                          'Milho',
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                          
                          ),
                          
                           Text(
                          'O tempo de sua colheita é de aproximadamente 90 dias no verão e de 100 dias no inverno.',
                          style: TextStyle(color: Colors.black),
                          ),    
                          

                    ],
                    ),
                  ),
                  
                ],
                
              ),
              
            ),
          ],
        ),
      ),
    ),
  );
}
}

class  CustumCardShapePainter extends CustomPainter{
  final double radius;
  final Color starColor;
  final endColor;

  CustumCardShapePainter(this.radius, this.starColor, this.endColor);

  @override
  void paint(Canvas canvas, Size size) {
      var radius = 24.0;
      
      var paint = Paint();
      paint.shader = ui.Gradient.linear(
        Offset(0,0), Offset(size.width, size.height),[
          HSLColor.fromColor(starColor).withLightness(0.8).toColor(),
          endColor
      ]);
  var path = Path()..moveTo(0, size.height)..quadraticBezierTo(size.width, size.height, size.width, size.height-radius )..lineTo(size.width, radius)..quadraticBezierTo(size.width, 0, size.width - radius, 0);
  

    }
  
    @override
    bool shouldRepaint( CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}













