import 'package:flutter/material.dart';
import 'package:pearl_edu_hub/rescources/dimens.dart';

class RoundedImageView extends StatelessWidget {
  const RoundedImageView({
    super.key,
    required this.imageData,
    required this.imageSize,
    this.boxFit = BoxFit.cover,
    this.isCircle = false,
    this.borderRadius,
  });

  final ImageProvider imageData;
  final double imageSize;
  final BoxFit? boxFit;
  final bool? isCircle;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: imageSize,
      height: imageSize,
      decoration: BoxDecoration(
          borderRadius: (isCircle ?? false) ? null : BorderRadius.circular(borderRadius ?? kRadius10),
          shape: (isCircle ?? false) ? BoxShape.circle : BoxShape.rectangle,
          image: DecorationImage(image: imageData, fit: boxFit)),
    );
  }
}
