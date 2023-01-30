import 'package:flutter/material.dart';
import '../pages/account/account.dart';
import '../pages/post/post.dart';


class AccountNav{
    static final accountRoutes = <String,WidgetBuilder>{
    "/" : (context) => const AccountScreen(),
    "/account/second" : (context) => const NewPost(),
  };
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static NavigatorState get _navigatorState => navigatorKey.currentState!;
  static NavigatorState get navigatorState => _navigatorState;


  static void backToMain(){
    _navigatorState.popUntil(ModalRoute.withName('/'));
  }
}