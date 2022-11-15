import 'package:flutter/material.dart';


class NewPost extends StatelessWidget {
  const NewPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('newpost'),
      ),
      body: SafeArea(
        child: Center(
          child: Text('newpost', style: TextStyle(fontSize: 32.0)),
        ),
      ),
    );
  }
}