import 'package:flutter/material.dart';
import 'package:cloud_functions/cloud_functions.dart';

class CloudFunctionPractice extends StatefulWidget {
  @override
  _CloudFunctionPractice createState() => _CloudFunctionPractice();
}

class _CloudFunctionPractice extends State<CloudFunctionPractice> {
  String _response = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cloud Functions example app'),
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.only(top: 32.0, left: 16.0, right: 16.0),
            child: Column(
              children: <Widget>[
                RaisedButton(
                  child: const Text('ADD MESSAGE'),
                  onPressed: () async {
                    try {
                      final dynamic resp = await CloudFunctions.instance.call(
                        functionName: 'addMessage',
                        parameters: <String, String>{
                          'text': 'aaaa',
                        },
                      );
                      print(resp);
                      setState(() {
                        _response = resp['result'];
                      });
                    } on CloudFunctionsException catch (e) {
                      print('caught firebase functions exception');
                      print(e.code);
                      print(e.message);
                      print(e.details);
                    } catch (e) {
                      print('caught generic exception');
                      print(e);
                    }
                  },
                ),
                Text('Response: $_response'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}