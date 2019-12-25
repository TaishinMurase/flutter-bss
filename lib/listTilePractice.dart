import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

class ListTilePractice extends StatelessWidget {
  final listItem = ['one', 'two', 'three'];

  // この辺のリスト表示はセットとして覚えとくとよい
  // ListView.builder系ははプロパティにbuilderを持つ
  // 特に意味はないけれど練習として作った
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('List Test'),),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black38),
                ),
              ),
              child: ListTile(
                leading: const Icon(Icons.flight_land),
                title: Text('$index'),
                subtitle: Text('&listItem'),
                onTap: () { /* react to the tile being tapped */ },
            ));},
        itemCount: listItem.length,
      ),
    );
  }
}