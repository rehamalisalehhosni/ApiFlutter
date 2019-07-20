import 'package:flutter/material.dart';
import 'package:appnew/partial/_drawer.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  loadData() async {
    print('click');
    List data = await getNewData();
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text('Home'),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.refresh),
              onPressed: loadData,
            )
          ],
        ),
        drawer: drawer(context),
        body: new Container(
          child:  buildWidgetMyData(),
        ));
  }

  Widget  buildWidgetMyData() {
    return new FutureBuilder(
        future: getNewData(),
        builder: (BuildContext context, AsyncSnapshot<List> snapShot) {
          if (snapShot.hasData) {
            return new ListView.builder(
              itemCount: snapShot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return new Stack(
                  children: <Widget>[
                    new Image.asset(
                      'images/3.jpg',
                      fit: BoxFit.cover,
                    ),
                    new Text(snapShot.data[index]['title']),
                  ],
                );
              },
            );
          } else {
            new Container(
               child: new Icon(Icons.refresh),
            );
          }
        });
  }

  Future<List> getNewData() async {
    String Url = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(Url);
    print(response.body);
    return json.decode(response.body);
  }
  // Future<List> getData() async {
  //   String url = 'https://jsonplaceholder.typicode.com/posts';
  //   http.Response response = await http.get(url);
  //   return json.decode(response.body);
  // }
}
