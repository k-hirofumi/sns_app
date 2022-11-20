import 'package:flutter/material.dart';
import 'package:my_app/instanceStore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReactionProvider with ChangeNotifier {
  ReactionProvider();

  InstanceStore get _store => InstanceStore();
  SharedPreferences get _pref => _store.getInstance<SharedPreferences>();

  final String firstName = "Jboy";
  final String lastName = "Hashimoto";
  int age = 0;

  void say() {
    // コンソールに表示
    print("Hello Person!!!");
    notifyListeners();
  }

  void addAge() {
    age++;
    notifyListeners();
  }
}