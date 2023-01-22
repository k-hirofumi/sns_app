import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sns_app/providers/accountProvider.dart';
import 'package:sns_app/providers/appProvider.dart';
import 'package:sns_app/utils/instance_store.dart';

class NewPost extends StatefulWidget {
  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  final _formKey = GlobalKey<FormState>();
  final appProvider = InstanceStore().getInstance<AppProvider>();
  final accountProvider = InstanceStore().getInstance<AccountProvider>();

  List<Item> items = [Item.create("")];

  @override
  void dispose() {
    items.forEach((element) {
      element.dispose();
    });

    super.dispose();
  }

  void add() {
    setState(() {
      items.add(Item.create(""));
    });
  }

  void remove(int id) {
    final removedItem = items.firstWhere((element) => element.id == id);
    setState(() {
      items.removeWhere((element) => element.id == id);
    });

    // itemのcontrollerをすぐdisposeすると怒られるので
    // 少し時間をおいてからdipose()
    Future.delayed(Duration(seconds: 1)).then((value) {
      removedItem.dispose();
    });
  }

  void submit() async{
    if (_formKey.currentState!.validate()) {
      // 入力データが正常な場合の処理
      _formKey.currentState!.save();

      String timeLineText = "";
      for(var i = 0; i < items.length; i++){
        i == 0 ? timeLineText += items[i].controller.text : timeLineText += '|' + items[i].controller.text;
      }
      // await appProvider.login();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Text(items.toString()),
              ...items.map((item) => textFieldItem(item)),
              ElevatedButton(
                onPressed: () {
                  add();
                },
                child: Text("追加"),
              ),
              ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
                onPressed: () {
                  submit();
                },
                child: Text("送信"),
              ),
            ],
          ),
        )
      ),
    );
  }

  Widget textFieldItem(
    Item item,
  ) {
    return Container(
      padding: EdgeInsets.only(top: 6),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: item.controller,
              onChanged: (text) {
                setState(() {
                  items = items
                      .map((e) => e.id == item.id ? item.change(text) : e)
                      .toList();
                });
              },
              autovalidateMode: AutovalidateMode.disabled,
              validator: (value) { // _formKey.currentState.validate()でコールされる
                if (value!.isEmpty) {
                  return '開始時間を入力してください'; // エラー表示のメッセージを返す
                }
                return null; // 問題ない場合はnullを返す
              },
              enabled: true,
              obscureText: false,
              maxLines:1 ,
              decoration: const InputDecoration(
                hintText: '開始時間を入力してください',
                labelText: '開始時間 *',
                border: OutlineInputBorder(), // 外枠付きデザイン
                filled: true, // fillColorで指定した色で塗り潰し
                fillColor: Colors.white
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              remove(item.id);
            },
          )
        ],
      )
    );
  }
}





class Item {
  final int id;
  final TextEditingController controller;
  final String text;

  Item({
    required this.id,
    required this.text,
    required this.controller,
  });

  factory Item.create(String text) {
    return Item(
      id: Random().nextInt(99999),
      text: text,
      controller: TextEditingController(text: text),
    );
  }

  Item change(String text) {
    return Item(id: this.id, text: text, controller: this.controller);
  }

  void dispose() {
    controller.dispose();
  }

  @override
  String toString() {
    return text;
  }
}