import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sns_app/navigation/main.dart';
import 'package:sns_app/providers/accountProvider.dart';
import 'package:sns_app/utils/instance_store.dart';
import '../../navigation/account.dart';


class AccountScreen extends StatelessWidget {
  AccountScreen({Key? key}) : super(key: key);

  void error() async{
    await MainNav.showErrorMessageDialog(title:'テストエラー', content: "ああああああ", okButton: true, ngButton: true);
  }

  @override
  Widget build(BuildContext context) {
    final accountProvider = InstanceStore().getInstance<AccountProvider>();
    void onGetUser() async{
        await accountProvider.getUserInfo();
    };

    final provider = context.watch<AccountProvider>();
    const flavor = String.fromEnvironment('FLAVOR');
    return Scaffold(
      appBar: AppBar(
        title: const Text('アカウント'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text('アカウント画面', style: TextStyle(fontSize: 32.0)),
              Text(provider.name, style: TextStyle(fontSize: 32.0)),
              Text(flavor, style: TextStyle(fontSize: 32.0)),
              ElevatedButton(onPressed: error, child: Text('error')),
              ElevatedButton(onPressed: onGetUser, child: Text('getuser')),
            ],
          )
        ),
      ),
    );
  }
}