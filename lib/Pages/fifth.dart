import 'package:flutter/material.dart';
import 'package:appnew/partial/_drawer.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:appnew/model/User.dart';
import 'package:appnew/Util/datatbaseHelper.dart';

List users;

class FifthPage extends StatefulWidget {
  @override
  _FifthPageState createState() => _FifthPageState();
}

class _FifthPageState extends State<FifthPage> {
  @override
  Future <List<dynamic>> getUsersList() async{
    var db = new datatbaseHelper();
    print('----------------');
    List _users=await db.getAllUsers();
    return  _users ;

  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text('Home'),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.refresh),
            )
          ],
        ),
        drawer: drawer(context),
        body: new Container(
          child: buildWidgetMyData(),
        ));
  }


  Widget  buildWidgetMyData() {
    return new FutureBuilder(
        future: getUsersList(),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapShot) {
          print(snapShot.data);
          if (snapShot.hasData) {
            return           
            new ListView.builder(
              itemCount: snapShot.data.length,
              itemBuilder: (_, int index) {
                return new Stack(
                  children: <Widget>[
                    new Image.asset(
                      'images/3.jpg',
                      fit: BoxFit.cover,
                    ),
                    new Text(User.fromMap(snapShot.data[index]).id.toString()),
                    new Text(User.fromMap(snapShot.data[index]).email.toString()),
                    new Text(User.fromMap(snapShot.data[index]).name.toString()),

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
}
