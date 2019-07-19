import 'package:flutter/material.dart';
import 'package:appnew/partial/_drawer.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SeconPage extends StatefulWidget {
  List data;
  SeconPage(List data) {
    this.data = data;
  }
  @override
  _SeconPageState createState() => _SeconPageState(data);
}

class _SeconPageState extends State<SeconPage> {
  List data;
  _SeconPageState(List data) {
    this.data = data;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Home'),
      ),
      drawer: drawer(context),
      body: new Container(
        child: new Center(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: new Text(
                  data[index]['title'],
                  style: new TextStyle(
                    color: Colors.brown,
                    fontSize: 22.0,
                  ),
                ),
                subtitle: new Text(
                  data[index]['body'],
                  style: new TextStyle(
                    color: Colors.blue,
                    fontSize: 11.0,
                  ),
                ),
                leading: new CircleAvatar(
                  child: new Text('${data[index]['id']}'),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                ),
              );
            },
          ),
          // child: new Column(
          //   children: <Widget>[
          //     RaisedButton(
          //       onPressed: getDataList,
          //       child: Text('Click Me '),
          //     ),

          //   ],
          // ),
        ),
      ),
    );
  }

  // Future<List> getData() async {
  //   String url = 'https://jsonplaceholder.typicode.com/posts';
  //   http.Response response = await http.get(url);
  //   return json.decode(response.body);
  // }
}
