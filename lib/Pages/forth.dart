import 'dart:io';

import 'package:flutter/material.dart';
import 'package:appnew/partial/_drawer.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class ForthPage extends StatefulWidget {
  @override
  _ForthPageState createState() => _ForthPageState();
}

class _ForthPageState extends State<ForthPage> {
  TextEditingController myController = new TextEditingController();
  myfunc() {
    writeFile(myController.text);
    print('Saved');
  }

  getDataSync() async {
    String data = await readLocalFile();
    if (data != null) {
      print(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text('Home'),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.refresh),
              onPressed: getDataSync,
            ),
          ],
        ),
        drawer: drawer(context),
        body: Center(
          child: new Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.all(10.0),
            child: new Column(
              children: <Widget>[
                new TextField(
                  controller: myController,
                  decoration: new InputDecoration(
                    icon: new Icon(
                      Icons.storage,
                      color: Colors.cyan,
                      size: 22.0,
                    ),
                    labelText: 'Name',
                  ),
                ),
                new RaisedButton(
                  child: new Text(
                    'Save',
                    style: new TextStyle(
                      color: Colors.white,
                      backgroundColor: Colors.blue,
                      fontSize: 10.5,
                    ),
                  ),
                  onPressed: myfunc,
                ),
                new FutureBuilder(
                    future: readLocalFile(),
                    builder:
                        (BuildContext context, AsyncSnapshot<String> data) {
                      if (data.hasData != null) {
                        return new Text('${data.data.toString()}',style: TextStyle(
                          color: Colors.brown,
                          fontSize: 14.0,
                        ),);
                      }else{
                         return new Text('No Data Exists ',style: TextStyle(
                          color: Colors.brown,
                          fontSize: 14.0,
                        ),);
                      }
                      //
                    }),
              ],
            ),
          ),
        ));
  }
}

Future<String> get localPath async {
  final path = await getApplicationDocumentsDirectory();
  return path.path;
}

Future<File> get localFile async {
  final file = await localPath;

  return new File('$file/data.txt');
}

Future<File> writeFile(String value) async {
  final file = await localFile;

  return file.writeAsString('$value');
}

Future<String> readLocalFile() async {
  try {
    final file = await localFile;
    final data = file.readAsString();
    return data;
  } catch (e) {
    return 'file not exists';
  }
}
