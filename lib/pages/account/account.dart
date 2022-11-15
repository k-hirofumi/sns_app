import 'package:flutter/material.dart';
import '../../navigation/account.dart';


class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('アカウント'),
      ),
      body: SafeArea(
        child: Center(
          child: Text('アカウント画面', style: TextStyle(fontSize: 32.0))),
      ),
    );
  }
}