import 'package:flutter/material.dart';

class DashboardClassDetailsPage extends StatelessWidget {
  const DashboardClassDetailsPage({super.key, required this.classItem});

  final String classItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clzss detail$classItem"),
      ),
    );
  }
}
