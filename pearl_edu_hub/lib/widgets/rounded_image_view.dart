import 'package:flutter/material.dart';

class RoundedImageView extends StatelessWidget {
  const RoundedImageView({super.key, required this.imageData});

  final ImageProvider imageData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: imageData, fit: BoxFit.cover)),
    );
  }
}
