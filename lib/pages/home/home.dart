import 'package:flutter/material.dart';
import '../../navigation/home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> toHomeSecond()async{
      HomeNav.toHomeSecondPage();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('ホーム'),
      ),
      body: SafeArea(
        child: Center(
           child: Column(
            children: [
              Text('ホーム画面', style: TextStyle(fontSize: 32.0)),
              ElevatedButton(
                onPressed: toHomeSecond, 
                child: Text("次へ"))
            ],
           )
        ),
      ),
    );
  }
}