import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:portfolio/features/home/presentation/widgets/styled_button.dart';

class DownloadCVButton extends StatelessWidget {
  const DownloadCVButton({super.key, required this.cvUrl, required this.title});

  final String cvUrl;
  final String title;
  void _downloadCV() {
    html.window.open(cvUrl, "_blank"); // يفتح في تاب جديدة
  }

  @override
  Widget build(BuildContext context) {
    return SecondaryButton(onPressed: _downloadCV, title: title);
  }
}
