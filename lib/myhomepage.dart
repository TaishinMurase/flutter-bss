import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_scheduler/cloudFunctionPractice.dart';

import 'createThread.dart';
import 'makeThreadList.dart';
import 'listViewPractice.dart';
import 'listTilePractice.dart';
import 'stackPractice.dart';
import 'cloudFunctionPractice.dart';


class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // for bottom navigator 別クラスから参照されないフィールドや関数はプライベート(_)にする
  int _selectedBottomIndex = 0;

  void _onItemTapped(int index){
    setState(() {
      _selectedBottomIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      // pagecontroler使ってボディをindexに応じて動的に変更すれば遷移できそう！？
      body: _buildBody(), 
      bottomNavigationBar: _buildBottomNavigator(), 
    );
  }

  // 画面遷移のため
  // 画面から非表示になったWidgetは解放されてしまうので、Stackで画面を重ねておく。Stackを使うことによって、画像の上に画像を重ねたりもできる
  // また、indexとOffstageによって非アクティブにしたり、
  // TickerModeでアニメーションを停止したりできる。
  // 以上より、Widgetはツリーに残っているのでStateが保たれる
  Widget _buildBody(){
    return Stack(
        children: <Widget>[
            Offstage(
                offstage: _selectedBottomIndex != 0,
                child: TickerMode(
                    enabled: _selectedBottomIndex == 0,
                    child: MaterialApp(home: MakeThreadList()),
                ),
            ),
            Offstage(
                offstage: _selectedBottomIndex != 1,
                child: TickerMode(
                    enabled: _selectedBottomIndex == 1,
                    child:  MaterialApp(home: ListTilePractice()),
                ),
            ),
            // Offstage(
            //     offstage: _selectedBottomIndex != 2,
            //     child: TickerMode(
            //         enabled: _selectedBottomIndex == 2,
            //         child: StackPractice(),
            //     ),
            // ),
            Offstage(
                offstage: _selectedBottomIndex != 2,
                child: TickerMode(
                    enabled: _selectedBottomIndex == 2,
                    child: CloudFunctionPractice(),
                ),
            ),
        ],
    );
  }

  Widget _buildAppbar(){
    return AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.poll),
            tooltip: 'Next page',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateThread()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.pages),
            tooltip: 'Next page',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListViewPractice()),
              );
            },
          ),
        ],
      );
  }

  Widget _buildBottomNavigator(){
    return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.business),
              title: Text('Business'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.school),
              title: Text('School'),
          ),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.watch),
          //     title: Text('Sample'),
          // ),
        ],
        currentIndex: _selectedBottomIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      );
  }

}