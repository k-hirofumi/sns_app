import 'package:flutter/material.dart';
import 'package:sns_app/network/model/postInfo_response.dart';

class PostTimeLine extends StatelessWidget {
  const PostTimeLine({super.key, required this.post});

  final List<PostTimeLineInfo> post;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for(var line in post) 
          Container( 
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(line.period), 
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 5), 
                    child: Text(line.event,overflow: TextOverflow.clip)
                  )
                )
              ]
            )
          )
        ] ,
    );
  }
}