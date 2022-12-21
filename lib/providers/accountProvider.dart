import 'package:flutter/material.dart';
import 'package:sns_app/instance_store.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sns_app/network/model/userInfo_response.dart';
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
    UserInfoResponse? _userInfo = await GetUserInfoRequest.getUserInfo();
    _userId = _userInfo!.userId;
    _name = _userInfo!.name;
    _email = _userInfo!.email;
    // _pref.setBool('isLogin', _isLogin);
    notifyListeners();
  }
}