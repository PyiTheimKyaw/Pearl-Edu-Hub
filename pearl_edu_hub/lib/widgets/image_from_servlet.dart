import 'package:flutter/material.dart';

class ImageDisplayPage extends StatelessWidget {
  final int imageId;

  ImageDisplayPage(this.imageId);

  @override
  Widget build(BuildContext context) {
    String imageUrl = 'http://192.168.1.3:8082/pearlEduHubApi/image?id=1';

    return Image.network(
      imageUrl,
      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
          return CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                : null,
          );
        }
      },
    );
  }
}
