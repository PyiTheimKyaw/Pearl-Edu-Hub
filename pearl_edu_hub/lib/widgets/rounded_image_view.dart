import 'package:flutter/material.dart';

class RoundedImageView extends StatelessWidget {
  const RoundedImageView({super.key, required this.imageData,required this.imageSize});

  final ImageProvider imageData;
  final double imageSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: imageSize,
      height: imageSize,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: imageData, fit: BoxFit.cover)),
    );
  }
}
