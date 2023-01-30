import 'package:flutter/material.dart';
import 'package:sns_app/pages/search/search_second.dart';
import '../pages/search/search.dart';

class SearchNav{
    static final searchRoutes = <String,WidgetBuilder>{
    "/" : (context) => const SearchScreen(),
    "/search/second" : (context) => const SearchSecond(),
  };
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static NavigatorState get _navigatorState => navigatorKey.currentState!;
  static NavigatorState get navigatorState => _navigatorState;


  static void backToMain(){
    _navigatorState.popUntil(ModalRoute.withName('/'));
  }
  static Future<void> toSearchSecondPage(BuildContext context){
    return _navigatorState.pushNamed('/search/second');
  }
}