import 'package:crafty_bay_ecommerce_project/app/app_colors.dart';
import 'package:flutter/material.dart';

class ProductQuantityIncDecButton extends StatefulWidget {
  final Function(int) onChange;

  const ProductQuantityIncDecButton({super.key, required this.onChange});

  @override
  State<ProductQuantityIncDecButton> createState() => _ProductQuantityIncDecButtonState();
}

class _ProductQuantityIncDecButtonState extends State<ProductQuantityIncDecButton> {
  int _count = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildIconButton(
          onTap: () {
            if (_count > 1) {
              _count--;
              widget.onChange(_count);
              setState(() {});
            }
          },
          icon: Icons.remove,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            '$_count',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        _buildIconButton(
          onTap: () {
            if (_count < 20) {
              _count++;
              widget.onChange(_count);
              setState(() {});
            }
          },
          icon: Icons.add,
        ),
      ],
    );
  }

  Widget _buildIconButton({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: AppColors.themeColor,
          borderRadius: BorderRadius.circular(4),
        ),
        alignment: Alignment.center,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
