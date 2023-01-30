import 'package:flutter/material.dart';

class SearchSecond extends StatefulWidget {
  const SearchSecond({super.key});

  @override
  State<SearchSecond> createState() => _SearchSecondState();
}

class _SearchSecondState extends State<SearchSecond> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(seconds: 3), 
        vsync: this
      );
    _colorAnimation = ColorTween(
        begin: Colors.grey, //アニメーション前の値
        end: Colors.red //アニメーション後の値
      ).animate(_controller);  // AnimationControllerの設定
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller, //コントローラの設定
      builder: (BuildContext context, Widget? child) {
        return IconButton(
          onPressed: () {
            if (_controller.status == AnimationStatus.dismissed) {
              _controller.forward();//アニメーション開始
            } else if (_controller.status == AnimationStatus.completed) {
              _controller.reverse();//逆向きのアニメーション開始
            }
          },
          icon: const Icon(Icons.favorite),
          color: _colorAnimation.value,//Tweenの値で色を変更
        );
      }
    );
  }
}
