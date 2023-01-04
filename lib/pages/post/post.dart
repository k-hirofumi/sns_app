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

  List<Map<String,Item>> items = [{"startTime": Item.create(""),"endTime": Item.create(""),"event": Item.create("")}];

  @override
  void dispose() {
    items.forEach((item) {
      item["startTime"]!.dispose();
      item["endTime"]!.dispose();
      item["event"]!.dispose();
        // textField.dispose();
    });

    super.dispose();
  }

  void add() {
    //開始、終了時間、イベントの入力欄を追加
    setState(() {
      items.add({"startTime": Item.create(""),"endTime": Item.create(""),"event": Item.create("")});
    });
  }

  void remove(int id) {
    //開始時間のIDで削除
    final removedItem = items.firstWhere((item) => item["startTime"]!.id == id);
    setState(() {
      items.removeWhere((item) => item["startTime"]!.id == id);
    });

    // itemのcontrollerをすぐdisposeすると怒られるので
    // 少し時間をおいてからdipose()
    Future.delayed(Duration(seconds: 1)).then((value) {
      removedItem["startTime"]!.dispose();
      removedItem["endTime"]!.dispose();
      removedItem["event"]!.dispose();
    });
  }

  void submit() async{
    if (_formKey.currentState!.validate()) {
      // 入力データが正常な場合の処理
      _formKey.currentState!.save();

      String periods = "";
      String events = "";
      for(var i = 0; i < items.length; i++){
        if(i == 0) {
          periods += '${items[i]["startTime"]!.controller.text} ~ ${items[i]["endTime"]!.controller.text}';
          events += items[i]["event"]!.controller.text;
        }else{
          periods += '|${items[i]["startTime"]!.controller.text} ~ ${items[i]["endTime"]!.controller.text}';
          events += '|${items[i]["event"]!.controller.text}';
        }
      }

      print(periods);
      print(events);
      // await appProvider.login();
    }
  }

  String toJapanese(String key){
    switch (key) {
      case "startTime":
        return "開始時間";
      case "endTime":
        return "終了時間";
      case "event":
        return "イベント";
   
      default:
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
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
    Map<String, Item> item
  ) {

    return Container(
      // padding: EdgeInsets.only(top: 6),
      child: Row(
        children: [
          Expanded(
            child: Container(
              constraints: BoxConstraints(minHeight: 110),
              // height: 110,
              width:  800,
              child:Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Container(
                    child:Row(
                      children: [
                        //開始時間
                        Expanded(
                          child: TextFormField(
                            controller: item["startTime"]!.controller,
                            onChanged: (text) {
                              setState(() {
                                for(var i = 0; i < items.length; i++){
                                  items[i]["startTime"] = items[i]["startTime"]!.id == item["startTime"]!.id ? item["startTime"]!.change(text) : items[i]["startTime"]!;
                                }
                              });
                            },
                            autovalidateMode: AutovalidateMode.disabled,
                            validator: (value) { // _formKey.currentState.validate()でコールされる
                              if (value!.isEmpty) {
                                return toJapanese("startTime") + 'が空白です';
                              }
                              return null; // 問題ない場合はnullを返す
                            },
                            enabled: true,
                            obscureText: false,
                            maxLines: 1,
                            maxLength: 5,
                            decoration: InputDecoration(
                              // hintText: toJapanese("startTime") + 'を入力してください',
                              hintText: '例.8:30=>0830',
                              labelText: toJapanese("startTime") + ' *',
                              border: OutlineInputBorder(), // 外枠付きデザイン
                              filled: true, // fillColorで指定した色で塗り潰し
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.only(top: 0, bottom: 0,left: 10), 
                            ),
                          ),
                        ),
                        //終了時間
                        Expanded(
                          child: TextFormField(
                            controller: item["endTime"]!.controller,
                            onChanged: (text) {
                              setState(() {
                                for(var i = 0; i < items.length; i++){
                                  items[i]["endTime"] = items[i]["endTime"]!.id == item["endTime"]!.id ? item["endTime"]!.change(text) : items[i]["endTime"]!;
                                }
                              });
                            },
                            autovalidateMode: AutovalidateMode.disabled,
                            validator: (value) { // _formKey.currentState.validate()でコールされる
                              if (value!.isEmpty) {
                                return toJapanese("endTime") + 'が空白です';
                              }
                              return null; // 問題ない場合はnullを返す
                            },
                            enabled: true,
                            obscureText: false,
                            maxLines: 1,
                            maxLength: 5,
                            decoration: InputDecoration(
                              hintText: '例.8:30=>0830',
                              labelText: toJapanese("endTime") + ' *',
                              border: OutlineInputBorder(), // 外枠付きデザイン
                              filled: true, // fillColorで指定した色で塗り潰し
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.only(top: 0, bottom: 0,left: 10), 
                            ),
                          ),
                        ),
                      ]
                    ),
                  ),                  
                  Padding(padding: EdgeInsets.only(top: 5)),
                  //イベント
                  Container(
                    child: TextFormField(
                      controller: item["event"]!.controller,
                      onChanged: (text) {
                        setState(() {
                          for(var i = 0; i < items.length; i++){
                            items[i]["event"] = items[i]["event"]!.id == item["event"]!.id ? item["event"]!.change(text) : items[i]["event"]!;
                          }
                        });
                      },
                      autovalidateMode: AutovalidateMode.disabled,
                      validator: (value) { // _formKey.currentState.validate()でコールされる
                        if (value!.isEmpty) {
                          return toJapanese("event") + 'が空白です';
                        }
                        return null; // 問題ない場合はnullを返す
                      },
                      enabled: true,
                      obscureText: false,
                      maxLines: 6,
                      maxLength: 200,
                      decoration: InputDecoration(
                        hintText: toJapanese("event") + 'を入力してください(最大500文字)',
                        labelText: toJapanese("event") + ' *',
                        border: OutlineInputBorder(), // 外枠付きデザイン
                        filled: true, // fillColorで指定した色で塗り潰し
                        fillColor: Colors.white
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 100,
            width: 50,
            child:IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                remove(item["startTime"]!.id);
              },
            )
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