import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay_ecommerce_project/app/app_colors.dart';
import 'package:flutter/material.dart';

class ProductImageCarouselSlider extends StatefulWidget {
  final List<String> imageUrls;

  const ProductImageCarouselSlider({super.key, required this.imageUrls});

  @override
  State<ProductImageCarouselSlider> createState() => _ProductImageCarouselSliderState();
}

class _ProductImageCarouselSliderState extends State<ProductImageCarouselSlider> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 220,
            viewportFraction: 0.95,
            onPageChanged: (currentIndex, reason) {
              _selectedIndex.value = currentIndex;
            },
          ),
          items: widget.imageUrls.map((url) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      image: DecorationImage(
                          image: NetworkImage(url),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            },
          ).toList(),
        ),
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(
            valueListenable: _selectedIndex,
            builder: (context, value, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < widget.imageUrls.length; i++)
                    Container(
                      height: 16,
                      width: 16,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        color: value == i
                            ? AppColors.themeColor
                            : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
