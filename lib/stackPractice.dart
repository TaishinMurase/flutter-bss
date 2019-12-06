import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

class StackPractice extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Stack(
      children: <Widget>[
        Positioned(
            left: 50.0,
            top: 50.0,
            width: 100.0,
            height: 100.0,
            child: Container(color: Colors.indigo,),
        ),
        Positioned(
            left: 100.0,
            top: 100.0,
            right: 100.0,
            bottom: 200.0,
            child: Container(color: Colors.cyan,),
        ),
        Positioned(
            left: 150.0,
            top: 150.0,
            right: 100.0,
            bottom: 200.0,
            child: Text(
                '加藤純一最強！',
                style: TextStyle(fontSize: 22.0, color: Colors.red)
            ),
        ),
        Positioned(
            left: 20.0,
            top: 0.0,
            right: 100.0,
            bottom: 200.0,
            child: Image.asset('images/oishi.jpg'),
        ),
      ],
    );
  }
}