import 'package:flutter/material.dart';
import '../pages/account/account.dart';
import '../pages/post/post.dart';


class AccountNav{
    static final accountRoutes = <String,WidgetBuilder>{
    "/" : (context) => AccountScreen(),
    "/account/second" : (context) => NewPost(),
  };
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static NavigatorState  _navigatorState = navigatorKey.currentState!;
  static NavigatorState get navigatorState => _navigatorState;


  static void backToMain(){
    _navigatorState.popUntil(ModalRoute.withName('/'));
  }
}