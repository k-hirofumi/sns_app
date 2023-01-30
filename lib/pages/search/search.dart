import 'package:flutter/material.dart';
import '../../navigation/search.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> toSearchSecond()async{
      SearchNav.toSearchSecondPage(context);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('探す'),
      ),
      body: SafeArea(
        child: Center(
           child: Column(
            children: [
              const Text('探す画面', style: TextStyle(fontSize: 32.0)),
              ElevatedButton(
                onPressed: toSearchSecond, 
                child: const Text("次へ"))
            ],
           )
        ),
      ),
    );
  }
}