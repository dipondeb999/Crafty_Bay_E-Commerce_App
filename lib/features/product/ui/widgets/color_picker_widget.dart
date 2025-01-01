import 'package:flutter/material.dart';

class ColorPickerWidget extends StatefulWidget {
  final List<String> colors;

  const ColorPickerWidget({super.key, required this.colors});

  @override
  State<ColorPickerWidget> createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [],
    );
  }
}
