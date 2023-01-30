import 'package:flutter/material.dart';
import 'package:sns_app/pages/home/home_pecond.dart';
import '../pages/home/home.dart';

class HomeNav{
    static final homeRoutes = <String,WidgetBuilder>{
    "/" : (context) => const HomeScreen(),
    "/home/second" : (context) => const HomeSecond(),
  };
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static NavigatorState get _navigatorState => navigatorKey.currentState!;
  static NavigatorState get navigatorState => _navigatorState;


  static void backToMain(){
    _navigatorState.popUntil(ModalRoute.withName('/'));
  }
  static Future<void> toHomeSecondPage(){
    // return Navigator.of(context).pushNamed('/home/second');
    return _navigatorState.pushNamed('/home/second');
  }

}