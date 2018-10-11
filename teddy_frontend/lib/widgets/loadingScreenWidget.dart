import 'package:flutter/material.dart';

class LoadingScreenWidget extends StatelessWidget {
  LoadingScreenWidget({Key key}) : super(key: key);
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: CircularProgressIndicator(backgroundColor: Colors.purpleAccent[100])),
      backgroundColor: Colors.white,
    );
  }
}
