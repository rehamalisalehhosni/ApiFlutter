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
  loadData() async{
    print('click');
    Map data= await getNewData();
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
      body: new ListView(
        children: <Widget>[
          new Stack(
            children: <Widget>[
              new Image.asset(
                'images/1.jpeg',
                fit: BoxFit.cover,
              ),
              new Text('Hellow '),
            ],
          ),
          new Stack(
            children: <Widget>[
              new Image.asset(
                'images/2.jpeg',
                fit: BoxFit.cover,
              ),
              new Text('Hellow '),
            ],
          ),
          new Stack(
            children: <Widget>[
              new Image.asset(
                'images/3.jpg',
                fit: BoxFit.cover,
              ),
              new Text('Hellow '),
            ],
          ),
            new Stack(
            children: <Widget>[
              new Image.asset(
                'images/1.jpeg',
                fit: BoxFit.cover,
              ),
              new Text('Hellow '),
            ],
          ),
            new Stack(
            children: <Widget>[
              new Image.asset(
                'images/2.jpeg',
                fit: BoxFit.cover,
              ),
              new Text('Hellow '),
            ],
          ),
            new Stack(
            children: <Widget>[
              new Image.asset(
                'images/3.jpg',
                fit: BoxFit.cover,
              ),
              new Text('Hellow '),
            ],
          ),
        ],
      ),
    );
  }

Future<Map> getNewData() async{
  String Url ="http://api.apixu.com/v1/current.json?key=f7aacc40a13b4000b1c145658191907&q=Paris";
  http.Response response=await http.get(Url);
  print(response.body);
  return json.decode(response.body);

}
Widget widgetMyData (){
  return new FutureBuilder(
    future: getNewData(),
    builder: (BuildContext context, AsyncSnapshot<Map> snapShot){
      if(snapShot.hasData){
        
      }

    }
  ) ;
}
  // Future<List> getData() async {
  //   String url = 'https://jsonplaceholder.typicode.com/posts';
  //   http.Response response = await http.get(url);
  //   return json.decode(response.body);
  // }
}
