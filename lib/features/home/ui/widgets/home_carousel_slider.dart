import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay_ecommerce_project/app/app_colors.dart';
import 'package:crafty_bay_ecommerce_project/features/home/models/banner_model.dart';
import 'package:flutter/material.dart';

class HomeCarouselSlider extends StatefulWidget {
  final List<BannerModel> bannerList;

  const HomeCarouselSlider({super.key, required this.bannerList,});

  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 180,
            viewportFraction: 0.95,
            onPageChanged: (currentIndex, reason) {
              _selectedIndex.value = currentIndex;
            },
          ),
          items: widget.bannerList.map((banner) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(banner.image ?? ''),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              banner.title ?? '',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 90,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text('Buy Now'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ).toList(),
        ),
        const SizedBox(height: 8),
        ValueListenableBuilder(
          valueListenable: _selectedIndex,
          builder: (context, value, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < widget.bannerList.length; i++)
                  Container(
                    height: 16,
                    width: 16,
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      color: value == i
                          ? AppColors.themeColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: AppColors.themeColor,
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
