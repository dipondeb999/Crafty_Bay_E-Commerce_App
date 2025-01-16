import 'package:crafty_bay_ecommerce_project/app/app_colors.dart';
import 'package:flutter/material.dart';

class ColorPickerWidget extends StatefulWidget {
  final List<String> colors;
  final Function(String) onColorSelected;

  const ColorPickerWidget({super.key, required this.colors, required this.onColorSelected});

  @override
  State<ColorPickerWidget> createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  String? _selectedColor;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _getColorIcons(),
      ),
    );
  }

  List<Widget> _getColorIcons() {
    List<Widget> colorItemWidgetList = [];
    for (String color in widget.colors) {
      Widget item = getColorItemWidget(
        name: color,
        onTap: () {
          _selectedColor = color;
          widget.onColorSelected(_selectedColor!);
          setState(() {});
        },
        isSelected: _selectedColor == color,
      );
      colorItemWidgetList.add(item);
    }
    return colorItemWidgetList;
  }

  Widget getColorItemWidget(
      {required String name,
      required VoidCallback onTap,
      required bool isSelected}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.themeColor : Colors.transparent,
          border: Border.all(),
        ),
        alignment: Alignment.center,
        child: Text(
          name,
          style: TextStyle(
            color: isSelected ? Colors.white : null,
          ),
        ),
      ),
    );
  }
}
