
import 'package:flutter/material.dart';

class ImageForPost extends StatelessWidget {
  final String imageUrl;
  const ImageForPost({
    Key? key, required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.only(left: 3),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey.shade200)
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(imageUrl,width: 100,height: 100)),
      ),
    );
  }
}