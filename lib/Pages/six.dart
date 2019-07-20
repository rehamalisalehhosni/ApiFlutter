import 'package:flutter/material.dart';
import 'package:appnew/partial/_drawer.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:appnew/ui/listViewEmployee.dart';

List users;

class SixPage extends StatefulWidget {
  @override
  _SixPageState createState() => _SixPageState();
}

class _SixPageState extends State<SixPage> {
  @override  
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
        body: new ListViewEmployee(),
        );
  }
}

