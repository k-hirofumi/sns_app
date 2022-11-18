import 'package:flutter/material.dart';


class HomeSecond extends StatelessWidget {
  const HomeSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ホーム2'),
      ),
      body: SafeArea(
        child: Center(
          child: Text('ホーム2', style: TextStyle(fontSize: 32.0)),
        ),
      ),
    );
  }
}