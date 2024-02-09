import 'package:flutter/material.dart';
import 'package:pearl_edu_hub/widgets/customized_text_view.dart';

class DashboardStudentsPage extends StatelessWidget {
  const DashboardStudentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomizedTextView(textData: "Students"),
      ],
    );
  }
}
