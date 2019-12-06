import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';


class ListViewPractice extends StatelessWidget {

  final listItem = ["one", "two", "three", "four", "five", "six", "seven"];

  @override
  Widget build(BuildContext context){
    print('build');
    return Scaffold(
      appBar: AppBar(title: Text("List Test"),),
      body: ListView.builder(
          itemBuilder: (BuildContext context, int index){
            return Card(
                child: Padding(
                    child: Text(listItem[index], style: TextStyle(fontSize: 22.0),),
                    padding: EdgeInsets.all(20.0),
                )
            );
          },
          itemCount: listItem.length, // itemカウントの上限を選択
      )
    );
  }

}