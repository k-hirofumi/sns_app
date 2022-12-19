import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sns_app/components/post/post.dart';
import 'package:sns_app/components/post/post_account.dart';
import 'package:sns_app/components/post/post_image.dart';
import 'package:sns_app/components/post/post_timeLine.dart';
import 'package:sns_app/network/mock/posts_mock.dart';
import 'package:sns_app/network/model/postInfo_response.dart';
import 'package:sns_app/network/request/home_request.dart';
import '../../navigation/home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<PostInfoResponse> _postsss = [];


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      _postsss = (await HomeRequest.getPostForHome())!;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<void> toHomeSecond()async{
      HomeNav.toHomeSecondPage();
    }


  final posts = <Post>[
    for(var post in _postsss)
    Post(
      postInfoResponse: post
    )
  ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('ホーム'),
      ),
      body: SafeArea(
        child: Center(
          child:ListView.builder(
            // padding: const EdgeInsets.all(5),
            itemCount: posts.length,//List(List名).length
            itemBuilder: (BuildContext context, int index) {
              return posts[index];
            }
          )
        ),
      ),
    );
  }
}


