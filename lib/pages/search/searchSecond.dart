import 'package:flutter/material.dart';


class SearchSecond extends StatelessWidget {
  const SearchSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('探す2'),
      ),
      body: SafeArea(
        child: Center(
          child: Text('探す2', style: TextStyle(fontSize: 32.0)),
        ),
      ),
    );
  }
}