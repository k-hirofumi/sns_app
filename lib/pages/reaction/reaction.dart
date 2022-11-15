import 'package:flutter/material.dart';
import '../../navigation/reaction.dart';


class ReactionScreen extends StatelessWidget {
  const ReactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('反響'),
      ),
      body: SafeArea(
        child: Center(
          child: Text('反響画面', style: TextStyle(fontSize: 32.0))),
      ),
    );
  }
}