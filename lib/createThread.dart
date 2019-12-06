import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // for cloud firestore

class CreateThread extends StatefulWidget {

   @override
  _CreateThread createState() => _CreateThread();
}

class _CreateThread extends State<CreateThread> {
  String _thredTitle;
  String _thredDescription;

  // instance of firestore
 final threadReference = Firestore.instance.collection('Thread');

  bool _whetherDisabledReturnsBool(String title, String description) {
    if(title != null && description != null){
      return true;
    }else {
      return false;
    }
  }

  void _createThread(){
    print('hello createthread');
    threadReference.document().setData({
      'title': _thredTitle,
      'description': _thredDescription,
      'bool': null
    });
    // back screan
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    print('build Widget');
    return Scaffold(
      appBar: AppBar(
        title: Text('投稿するよ'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0)
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "テキストボックス",
              hintText: "タイトルを入力！",
            ),
            onChanged: (text) {
              if (text.length > 0) {
                setState(() {
                  this._thredTitle = text;
              });
              } else {
                setState(() {
                  this._thredTitle = "入力してください。";
              });
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0)
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "テキストボックス",
              hintText: "詳細を入力して",
            ),
            onChanged: (text) {
              if (text.length > 0) {
                setState(() {
                  this._thredDescription = text;
              });
            } else {
                setState(() {
                  this._thredDescription = "入力してください。";
              });
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0)
          ),
          // Text(thredTitle),
          // Text(thredDescription),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0)
          ),
          RaisedButton(
            child: Text('Create Thread !'),
              onPressed: _whetherDisabledReturnsBool(this._thredTitle, this._thredDescription) 
                ? () => _createThread() : null
          ),
        ],
      )
    );
  }
}