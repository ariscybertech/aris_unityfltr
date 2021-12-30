import 'package:flutter/material.dart';
import 'package:flutter_unity/flutter_unity.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String actualModel = 'Model S';
  UnityViewController unityViewController;
  double speed = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {});
  }

  void onUnityViewCreated(UnityViewController controller) {
    controller.send(
      'Init',
      'loadModel',
      actualModel.replaceAll(' ', '').toLowerCase(),
    );
    setState(() {
      unityViewController = controller;
    });
  }

  void onUnityViewReattached(UnityViewController controller) {
    setState(() {
      unityViewController = controller;
    });
  }

  void onUnityMessageReceived(UnityViewController controller, String message) {
    debugPrint('[message]: $message');
  }

  void setSpeed(double val) {
    setState(() {
      speed = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(actualModel),
      ),
      body: Column(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 1280 / 720,
              child: UnityView(
                onCreated: onUnityViewCreated,
                onReattached: onUnityViewReattached,
                onMessage: onUnityMessageReceived,
              ),
            ),
          ),
          Flexible(
            child: Slider.adaptive(
              value: speed,
              onChanged: setSpeed,
              min: 0,
              max: 400,
            ),
          ),
        ],
      ),
    );
  }
}
