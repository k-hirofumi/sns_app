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
              const Text('ホーム2', style: TextStyle(fontSize: 32.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (() => _provider.countUp()), child: const Text('カウントUP！')),
                  const Padding(padding: EdgeInsets.only(left: 10, right: 10)),
                  ElevatedButton(onPressed: (() => _provider.countClear()), child: const Text('クリア')),
                ],
              ),
              Text(_provider.cnt.toString(), style: const TextStyle(fontSize: 60.0),),
            ],
          ),

        ),
      ),
    );
  }
}