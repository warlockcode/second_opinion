import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Feed Screen',
          style: TextStyle(height: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
