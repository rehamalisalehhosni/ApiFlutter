import 'package:flutter/material.dart';
import 'dart:async';

Drawer drawer(context) {
  return Drawer(
    // Add a ListView to the drawer. This ensures the user can scroll
    // through the options in the drawer if there isn't enough vertical
    // space to fit everything.
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text('Drawer Header'),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        ListTile(
          title: Text('Home'),
          onTap: () {
            Navigator.pushNamed(context, '/home');
            // Update the state of the app
            // ...
            // Then close the drawer
//Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text('second Page'),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pushNamed((context), '/second');
            //   Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text('Third Page'),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pushNamed((context), '/third');
            //   Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text('Fourth Page'),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pushNamed((context), '/forth');
            //   Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text('Fifth Page'),
          onTap: () {
            // Update the state of the app
            // Then close the drawer
            Navigator.pushNamed((context), '/fifth');
            //   Navigator.pop(context);
          },
        ), 
          ListTile(
          title: Text('Six Page'),
          onTap: () {
            // Update the state of the app
            // Then close the drawer
            Navigator.pushNamed((context), '/six');
            //   Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}
