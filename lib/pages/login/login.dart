import 'package:flutter/material.dart';
import 'package:sns_app/utils/instance_store.dart';
import 'package:sns_app/providers/accountProvider.dart';
import 'package:sns_app/providers/appProvider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final appProvider = InstanceStore().getInstance<AppProvider>();
  final accountProvider = InstanceStore().getInstance<AccountProvider>();
  final emailInputController = TextEditingController();
  final passwordInputController = TextEditingController();
  void submit() async{
    if (_formKey.currentState!.validate()) {
      // 入力データが正常な場合の処理
      _formKey.currentState!.save();
      await appProvider.login(emailInputController.text, passwordInputController.text);
    }
  }

  @override
  void dispose() {
    emailInputController.dispose();
    passwordInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final form = Scaffold(
      body: SafeArea(
        child:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Container(
                  width: 320,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 73, 248, 237),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black.withOpacity(0.3)),
                  ),
                  child: Form(
                    key: _formKey,
                    child:Column(
                      children: [
                        const Padding(padding: EdgeInsets.all(15)),
                        SizedBox(
                          width: 280,
                          child:TextFormField(
                            controller: emailInputController,
                            autovalidateMode: AutovalidateMode.disabled,
                            validator: (value) { // _formKey.currentState.validate()でコールされる
                              if (value!.isEmpty) {
                                return 'メールアドレスを入力してください'; // エラー表示のメッセージを返す
                              }
                              return null; // 問題ない場合はnullを返す
                            },
                            enabled: true,
                            obscureText: false,
                            maxLines:1 ,
                            decoration: const InputDecoration(
                              hintText: 'メールアドレスを入力してください',
                              labelText: 'メールアドレス *',
                              border: OutlineInputBorder(), // 外枠付きデザイン
                              filled: true, // fillColorで指定した色で塗り潰し
                              fillColor: Colors.white
                            ),
                            //パスワード
                            // onChanged: _controllerText,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(10)),
                        SizedBox(
                          width: 280,
                          child:TextFormField(
                            controller: passwordInputController,
                            autovalidateMode: AutovalidateMode.disabled,
                            validator: (value) { // _formKey.currentState.validate()でコールされる
                              if (value!.isEmpty) {
                                return 'パスワード入力してください'; // エラー表示のメッセージを返す
                              }
                              return null; // 問題ない場合はnullを返す
                            },
                            enabled: true,
                            obscureText: false,
                            maxLines:1 ,
                            decoration: const InputDecoration(
                              hintText: 'パスワードを入力してください',
                              labelText: 'パスワード *',
                              border: OutlineInputBorder(), // 外枠付きデザイン
                              filled: true, // fillColorで指定した色で塗り潰し
                              fillColor: Colors.white
                            ),
                            //パスワード
                            // onChanged: _controllerText,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(15)),
                        SizedBox(
                          width: 220,
                          height: 40,
                          child: ElevatedButton(onPressed: submit, child: const Text("ログイン")),
                        ),
                        const Padding(padding: EdgeInsets.all(15)),
                      ]
                    )
                  )
                )
              // )
            ]
          ),
        )
      ) 
    );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: form,
    );
  }
}