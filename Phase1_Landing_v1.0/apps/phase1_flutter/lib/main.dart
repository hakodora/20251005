// Minimal Flutter app skeleton for Phase 1
import 'package:flutter/material.dart';

void main() {
  runApp(Phase1App());
}

class Phase1App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iBrushPal Phase1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(child: Text('Phase 1 - User Management Skeleton')),
      ),
    );
  }
}