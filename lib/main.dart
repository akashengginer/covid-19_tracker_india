import 'pages/loading.dart';
import 'package:flutter/material.dart';
import 'pages/home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: ('/'),
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
    },
  ));
}
