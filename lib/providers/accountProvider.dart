import 'package:flutter/material.dart';
import 'package:sns_app/utils/instance_store.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sns_app/network/request/get_user_info_request.dart';

class AccountProvider with ChangeNotifier {
  AccountProvider();

  InstanceStore get _store => InstanceStore();
  SharedPreferences get _pref => _store.getInstance<SharedPreferences>();

  String _userId = "";
  String _name = "";
  String _email = "";

  String get userId => _userId;
  String get name => _name;
  String get email => _email;

  Future<void> getUserInfo() async{
      final result = await GetUserInfoRequest.getUserInfo();
      if(result != null){
      _userId = result!.userId;
      _name = result!.name;
      _email = result!.email;
      }

    notifyListeners();
  }
}