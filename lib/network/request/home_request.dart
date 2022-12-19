import 'package:dio/dio.dart';
import 'package:sns_app/network/mock/posts_mock.dart';
import 'package:sns_app/network/model/postInfo_response.dart';

class HomeRequest {
  // static Future<PostInfoResponse> getPostForHome() async {
  //    final result = await http.post(Uri.https('example.com', 'whatsit/create'), body: {'key': 'value',});
  //    return PostInfoResponse.fromJson(result.body[0]);
  // }

  static Future<List<PostInfoResponse>?> getPostForHome() async {
    var response = await Dio().get('https://jsonplaceholder.typicode.com/todos/1'
    ).then((response) {



      //mockです
      var posts = <PostInfoResponse>[];
      for (var post in posts_mock){
        posts.add(PostInfoResponse.fromJson(post));
      }
      return posts;      
      

      // for (var post in response.data.length){
      //   posts.add(PostInfoResponse.fromJson(response.data));
      // }
      // return posts;

    }).catchError((err){
      throw "getPostForHome error" ;
   });
    return response;
  }
}

