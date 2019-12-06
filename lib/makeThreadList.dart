import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'pageBss.dart';

class MakeThreadList extends StatelessWidget {
  // StreamBuilderは参照しているCloud上のデータを監視して変更があった場合、画面に反映
  // ex) エミュレータを開く ➔ firebase上でデータ更新すると自動で画面更新される

  @override
  Widget build(BuildContext context) {
    print('build streambuilder');
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('Thread').snapshots(), // 監視するストリーム
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {  // 変かがあったときにstreamのsnapshotを取得して再構築？
        // snapshotが撮れない場合エラー
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting: return new Text('Loading...');
          default:
            print(snapshot);
            return new ListView(
              children: snapshot.data.documents.map((DocumentSnapshot document) {
                return new ListTile(
                  title: new Text(document['title']),
                  subtitle: new Text(document['description']),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PageBss(threadTitle:document['title'], threadFirstDescription: document['description'],)),
                    );
                  },
                );
              }).toList(),
            );
        }
      },
    );
  }
}