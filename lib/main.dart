import 'package:flutter/material.dart';
import 'package:appnew/Pages/home.dart';
import 'package:appnew/Pages/second.dart';
import 'package:appnew/Pages/third.dart';
import 'package:appnew/Pages/forth.dart';
import 'package:appnew/Pages/fifth.dart';
import 'package:appnew/Pages/six.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:appnew/Util/datatbaseHelper.dart';
import 'model/User.dart';

List users;

void main() async {
  var db = new datatbaseHelper();
  // db.SaveUser(new User('Reham@gmail.com', 8, 'Reham Ali ', '123456'));
  //  int delete =await db.deleteUser(8);
  //  print("delete ${delete}");
  // print("total ${await db.getAllUsersCount()}");
  // User user=await db.getUser(8);
  // print("user ${user.name}");
  // print("user ${user.email}");

  User newuser= User.fromMap({
     "id":7,
     "name":'remi',
     "email":'remi@gmail',
     "password":'1234'
  });
  await db.UpdateUser(newuser);
  users = await db.getAllUsers();
  for (int i = 0; i < users.length; i++) {
    User user = User.map(users[i]);
    print(user.id);
    print(user.name);
    print(user.email);
  }
  for (var item in users) {
    User user = User.map(item);
    print(user.id);
    print(user.name);
    print(user.email);
  }


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
        '/forth': (context) => ForthPage(),
        '/fifth': (context) => FifthPage(),
        '/six': (context) => SixPage(),
      },
    ),
  );
}

Future<List> getData() async {
  String url = 'https://jsonplaceholder.typicode.com/posts';
  http.Response response = await http.get(url);
  return json.decode(response.body);
}
