
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
    return Center(
      child: Column(
        children: [
          SizedBox(
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
                child: IconButton(onPressed: (() => prevImage()), icon: const Icon(Icons.arrow_left), padding: const EdgeInsets.all(0))
              ),
              SizedBox(
                width: 20, //横幅
                height: 20, //高さ
                child: IconButton(onPressed: (() => nextImage()), icon: const Icon(Icons.arrow_right), padding: const EdgeInsets.all(0))
              )
            ],
          )
        ],
      )
    );
  }
}