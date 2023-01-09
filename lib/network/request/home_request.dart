import 'package:dio/dio.dart';
import 'package:sns_app/navigation/main.dart';
import 'package:sns_app/network/mock/posts_mock.dart';
import 'package:sns_app/network/model/error_response.dart';
import 'package:sns_app/network/model/postInfo_response.dart';
import 'package:sns_app/utils/api_searvice.dart';

class HomeRequest {
  static Future<dynamic> getPostForHome() async {

    var result;
    try {
      result = await ApiSearvice.get('http://localhost/app.api/get_post');
      return PostInfoResponse.fromJson(result);

  //     //mockです
  //     var posts = <PostInfoResponse>[];
  //     for (var post in posts_mock){
  //       posts.add(PostInfoResponse.fromJson(post));
  //     }
  //     return posts;    

    }catch(e){
      try{
        final error = ErrorResponse.fromJson(result);
        await MainNav.showErrorMessageDialog(title:error.message,content: error.content, okButton: true);
      }catch(e){
        //エラーレスポンスの形式が不正な場合
        MainNav.showUnexpectErrorDialog(); 
      }
    }
  }
}