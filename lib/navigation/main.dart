import 'package:flutter/material.dart';
import 'package:sns_app/pages/login/login.dart';
import '../main.dart';
import '../pages/post/post.dart';

class MainNav{
    static final mainRoutes = <String,WidgetBuilder>{
    "/" : (context) => MainPage(),
    "/addNewPost" : (context) => NewPost(),
    "/login" : (context) => LoginForm(),
  };
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static NavigatorState  _navigatorState = navigatorKey.currentState!;
  static NavigatorState get navigatorState => _navigatorState;


  static void backToMain(){
    _navigatorState.popUntil(ModalRoute.withName('/'));
  }

  static void toMain(){
    _navigatorState.pushNamedAndRemoveUntil('/', ModalRoute.withName('/'),);
  }


  static Future<void> toNewPostOrverlay(BuildContext context){
    return _navigatorState.pushNamed('/addNewPost');
  }
}