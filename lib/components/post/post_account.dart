import 'package:flutter/material.dart';

class PostAccount extends StatelessWidget {
  const PostAccount({super.key, required this.imagePath, required this.name});

  final String imagePath;
  final String name;
  @override
  Widget build(BuildContext context) {
    return   Container(
      child: Row(
        children: [
          Container(
            width: 40,
            margin: EdgeInsets.only(right: 10,top: 5, bottom: 5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black.withOpacity(0.3)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(imagePath, fit: BoxFit.cover),
              // child: Image.asset('assets/sampleImages/pistol_pose_man.png', fit: BoxFit.cover,)
              ),
          ),
          Text(name, style: TextStyle(fontSize: 20)),
        ],
      )
    );
  }
}