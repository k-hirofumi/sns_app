import 'package:flutter/material.dart';
import 'package:my_app/instanceStore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeProvider with ChangeNotifier {
  HomeProvider();

  InstanceStore get _store => InstanceStore();
  SharedPreferences get _pref => _store.getInstance<SharedPreferences>();


  int _cnt = 0;
  int _age = 0;


  int get cnt => _cnt;



  void countUp() {
    _cnt++;
    _pref.setInt('cnt', _cnt);
    notifyListeners();
  }

  void countClear() {
    _cnt = 0;
    _pref.setInt('cnt', _cnt);
    notifyListeners();
  }

  void loadCount(){
    _cnt = _pref.getInt('cnt') ?? 0;
  }
}