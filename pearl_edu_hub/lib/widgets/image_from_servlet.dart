// import 'dart:convert';
//
// import 'package:flutter/material.dart';
//
// class ImageDisplayPage extends StatelessWidget {
//   final int imageId;
//
//   ImageDisplayPage(this.imageId);
//
//   @override
//   Widget build(BuildContext context) {
//     String imageUrl = 'http://localhost:8082/pearlEduHubApi/image?id=1';
//     var blob = "Blob@796e0da2";
//
//     var image = base64Decode(blob);
//     print("Image data blob $image");
//
//     return Image.network(
//       imageUrl,
//       loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
//         if (loadingProgress == null) {
//           return child;
//         } else {
//           return CircularProgressIndicator(
//             value: loadingProgress.expectedTotalBytes != null
//                 ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
//                 : null,
//           );
//         }
//       },
//     );
//   }
// }

import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ImageFromServlet extends StatefulWidget {
  const ImageFromServlet({super.key});

  @override
  _ImageFromServletState createState() => _ImageFromServletState();
}

class _ImageFromServletState extends State<ImageFromServlet> {
  Uint8List? _imageData;

  @override
  void initState() {
    super.initState();
    _fetchImage();
  }

  Future<void> _fetchImage() async {
    // Replace 'your_servlet_url' with the actual URL of your servlet
    String url = 'http://localhost:8082/pearlEduHubApi/image?id=3'; // Assuming id=1 for example

    try {
      final response = await http.get(Uri.parse(url));
      print("Rsponse is ${response}");
      if (response.statusCode == 200) {
        setState(() {
          _imageData = response.bodyBytes;
        });
      } else {
        print('Failed to load image: ${response.statusCode}');
      }
    } catch (e) {
      print('Error loading image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return _imageData != null ? Image.memory(_imageData!) : CircularProgressIndicator();
  }
}
