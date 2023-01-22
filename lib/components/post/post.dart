import 'package:flutter/material.dart';
import 'package:sns_app/components/post/post_account.dart';
import 'package:sns_app/components/post/post_image.dart';
import 'package:sns_app/components/post/post_timeLine.dart';
import 'package:sns_app/network/model/postInfo_response.dart';
import 'package:sns_app/pages/home/home.dart';

class Post extends StatelessWidget {
  const Post({super.key, required this.postInfoResponse});

  final PostInfoResponse postInfoResponse;

  @override
  Widget build(BuildContext context) {

    return  Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostAccount(
            imagePath: postInfoResponse.accountImage,
            name: postInfoResponse.accountName,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child:PostTimeLine(
                  post: postInfoResponse.timeLine
                )
              ),
              PostImage(imagesPath: postInfoResponse.images),
            ],
          ),
        ],
      )
    );
  }
}