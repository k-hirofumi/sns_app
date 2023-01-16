// import 'package:flutter/material.dart';


// class NewPost extends StatelessWidget {
//   const NewPost({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('newpost'),
//       ),
//       body: SafeArea(
//         child: Center(
//           child: Text('newpost', style: TextStyle(fontSize: 32.0)),
//         ),
//       ),
//     );
//   }
// }



import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sns_app/utils/instance_store.dart';
import 'package:sns_app/navigation/main.dart';
import 'package:sns_app/providers/accountProvider.dart';
import 'package:sns_app/providers/appProvider.dart';

class NewPost extends StatefulWidget {
  const NewPost({super.key});

  @override
  State<NewPost> createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  final _formKey = GlobalKey<FormState>();
  final appProvider = InstanceStore().getInstance<AppProvider>();
  final accountProvider = InstanceStore().getInstance<AccountProvider>();

  List<List<Item>> items = [];

  void submit() async{
    if (_formKey.currentState!.validate()) {
      // 入力データが正常な場合の処理
      _formKey.currentState!.save();
      // await appProvider.login();
    }
  }

  // void addTimeline(){
  //   setState(() {
  //     timelineCount++;
  //   });
  // }

    @override
  void dispose() {
    items.forEach((elements) {
      elements.forEach((element) {
        element.dispose();
      });
     });
    super.dispose();
  }

  void add() {
    setState(() {
      //開始、終了時間、イベントの入力欄を追加
      List<Item> item = [];
      for(int i = 0; i <3; i++) item.add(Item.create(""));
      items.add(item);
    });
  }

  void remove(int id) {
    //開始時間のIDで削除
    final removedTextFields = items.firstWhere((element) => element[0].id == id);
    setState(() {
      items.removeWhere((element) => element[0].id == id);
    });

    // itemのcontrollerをすぐdisposeすると怒られるので
    // 少し時間をおいてからdipose()
    Future.delayed(Duration(seconds: 1)).then((value) {
      for(var removedTextField in removedTextFields) removedTextField.dispose();
    });
  }

    Widget textFieldItem(
    List<Item> textFields,
  ) {
    return Row(
      children: [
        for(var textField in textFields)
        Expanded(
          child: TextField(
            controller: textField.controller,
            onChanged: (text) {
              setState(() {
                // items = items
                //     .map((e) => e.id == item.id ? item.change(text) : e)
                //     .toList();
              });
            },
          ),
        ),
        IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            // remove(item.id);
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    final timeline = Container(
      padding: EdgeInsets.only(top: 6),
      width: 280,
      child: Row(
        children:[
          Flexible(
            child: Container(
              padding: EdgeInsets.only(right: 5,left: 5),
              child:Column(
                children: [
                  Container(
                    height: 20,
                    child: TextFormField(
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
                  Container(
                    height: 20,
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.disabled,
                      validator: (value) { // _formKey.currentState.validate()でコールされる
                        if (value!.isEmpty) {
                          return '終了時間を入力してください'; // エラー表示のメッセージを返す
                        }
                        return null; // 問題ない場合はnullを返す
                      },
                      enabled: true,
                      obscureText: false,
                      maxLines:1 ,
                      decoration: const InputDecoration(
                        hintText: '終了時間を入力してください',
                        labelText: '終了時間 *',
                        border: OutlineInputBorder(), // 外枠付きデザイン
                        filled: true, // fillColorで指定した色で塗り潰し
                        fillColor: Colors.white
                      ),
                    ),
                  )
                ]
              )
            )
          ),
          Flexible(child: 
            Container(
              padding: EdgeInsets.only(right: 5,left: 5),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.disabled,
                validator: (value) { // _formKey.currentState.validate()でコールされる
                  if (value!.isEmpty) {
                    return 'イベントを入力してください'; // エラー表示のメッセージを返す
                  }
                  return null; // 問題ない場合はnullを返す
                },
                enabled: true,
                obscureText: false,
                maxLines:1 ,
                decoration: const InputDecoration(
                  hintText: 'イベントを入力してください',
                  labelText: 'イベント *',
                  border: OutlineInputBorder(), // 外枠付きデザイン
                  filled: true, // fillColorで指定した色で塗り潰し
                  fillColor: Colors.white
                ),
              )
            ),
          ),
        ]
      )
    );
    return Scaffold(
      body: SafeArea(
        child:Center(
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Text(items.toString()),
                ...items.map((item) => textFieldItem(item)),
                ElevatedButton(
                  onPressed: () {
                    add();
                  },
                  child: Text("追加"),
                ),
              ],
            ),
          )
        )
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