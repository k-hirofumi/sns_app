import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_app/providers/homeProvider.dart';


class HomeSecond extends StatelessWidget {
  const HomeSecond({super.key});


  @override
  Widget build(BuildContext context) {
    final _provider = context.watch<HomeProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('ホーム2'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text('ホーム2', style: TextStyle(fontSize: 32.0)),
              ElevatedButton(onPressed: (() => _provider.count()), child: Text('カウント！')),
              Text(_provider.cnt.toString(), style: TextStyle(fontSize: 60.0),),
            ],
          ),

        ),
      ),
    );
  }
}