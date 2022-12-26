import 'package:sns_app/navigation/main.dart';
import 'package:sns_app/network/model/error_response.dart';
import 'package:sns_app/network/model/userInfo_response.dart';
import 'package:sns_app/utils/api_searvice.dart';

class GetUserInfoRequest {

  static Future<dynamic> getUserInfo() async {
    var result;
    try {
      result = await ApiSearvice.get('http://localhost/app.api/user');
      return UserInfoResponse.fromJson(result);
    }catch(error){
      try{
        final error = ErrorResponse.fromJson(result);
        await MainNav.showErrorMessageDialog(title:error.message,content: "", okButton: true);
      }catch(e){
        //エラーレスポンスの形式が不正な場合
        MainNav.showUnexpectErrorDialog(); 
      }
    }
  }
}