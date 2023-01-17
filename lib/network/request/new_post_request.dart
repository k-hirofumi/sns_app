import 'package:dio/dio.dart';
import 'package:sns_app/navigation/main.dart';
import 'package:sns_app/network/model/error_response.dart';
import 'package:sns_app/network/model/no_data_response.dart';
import 'package:sns_app/utils/api_searvice.dart';

class NewPostRequest {

  static Future<dynamic> newPost(String periods, String events) async {
    var result;
    try {
      result = await ApiSearvice.post('/new_post',
        data: new FormData.fromMap(
          {
            "periods": periods,
            "events": events,
            "images": null,
          }
        )
      );
      return NoDataResponse.fromJson(result);
    }catch(error){
      try{
        final error = ErrorResponse.fromJson(result);
        await MainNav.showErrorMessageDialog(title:error.message, content: error.content, okButton: true);
      }catch(e){
        //エラーレスポンスの形式が不正な場合
        MainNav.showUnexpectErrorDialog(); 
      }
    }
  }
}

