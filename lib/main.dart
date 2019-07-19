import 'package:flutter/material.dart';
import 'package:appnew/Pages/home.dart';
import 'package:appnew/Pages/second.dart';
import 'package:appnew/Pages/third.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
void main() async {
  List data;
  data = await (getData());
  runApp(
    MaterialApp(
      home: new Home(),
      initialRoute: '/home',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/home': (context) => Home(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => SeconPage(data),
        '/third': (context) => ThirdPage(),
      },
    ),
  );
}

Future<List> getData() async {
  String url = 'https://jsonplaceholder.typicode.com/posts';
  http.Response response = await http.get(url);
  return json.decode(response.body);
}
