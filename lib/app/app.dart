import 'package:flutter/material.dart';
import 'package:unityflutter/view/Dashboard.dart';

class UnityApp extends StatefulWidget {
  @override
  _UnityAppState createState() => _UnityAppState();
}

class _UnityAppState extends State<UnityApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Dashboard(),
    );
  }
}
