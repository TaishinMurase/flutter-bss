import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// リストの個別ページの表示
class PageBss extends StatefulWidget{
  final String threadTitle;
  final String threadFirstDescription;
  PageBss({Key key, this.threadTitle, this.threadFirstDescription}) : super(key: key);


  @override
  _PageBss createState() => _PageBss();
}

class _PageBss extends State<PageBss> {

  @override
  Widget build(BuildContext context) {
    print('build Widget');
    return Container(
      child: Column(
        children: <Widget>[
          Card(
              child: Text(widget.threadFirstDescription, style: TextStyle(fontSize: 22.0),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0)
          ),
        ],
      )
    );

  }
}
