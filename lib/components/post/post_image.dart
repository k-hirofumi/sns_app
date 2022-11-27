
import 'package:flutter/material.dart';

class PostImage extends StatefulWidget {
  const PostImage({super.key, required this.imagesPath});

  final List<String> imagesPath;

  @override
  State<PostImage> createState() => _PostImageState();
}

class _PostImageState extends State<PostImage> {
  int _imageIndex = 0;

  void nextImage(){
    setState(() {
    _imageIndex++;
    _imageIndex = _imageIndex > widget.imagesPath.length -1  ? widget.imagesPath.length - 1 : _imageIndex;
    });
  }
  void prevImage(){
    setState(() {
      _imageIndex--;
      _imageIndex = _imageIndex < 0 ? 0 : _imageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Container(
              width: 105,
              height: 105,
              child: Stack(
                fit: StackFit.expand,
                children: [ for(var i=0; i < widget.imagesPath.length; i++ ) 
                  Offstage(
                    offstage: _imageIndex != i,
                    child: Image.network(widget.imagesPath[i], fit: BoxFit.cover)
                  )
                ]
              )
            ),
            Row(
              children: [
                SizedBox(
                  width: 20, //横幅
                  height: 20, //高さ
                  child: IconButton(onPressed: (() => prevImage()), icon: Icon(Icons.arrow_left), padding: EdgeInsets.all(0))
                ),
                SizedBox(
                  width: 20, //横幅
                  height: 20, //高さ
                  child: IconButton(onPressed: (() => nextImage()), icon: Icon(Icons.arrow_right), padding: EdgeInsets.all(0))
                )
              ],
            )
          ],
        )
      )
    );
  }
}