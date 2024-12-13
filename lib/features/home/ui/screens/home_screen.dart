import 'package:crafty_bay_ecommerce_app/app/assets_path.dart';
import 'package:crafty_bay_ecommerce_app/features/home/ui/widgets/app_bar_icon_button.dart';
import 'package:crafty_bay_ecommerce_app/features/home/ui/widgets/home_carousel_slider.dart';
import 'package:crafty_bay_ecommerce_app/features/home/ui/widgets/product_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String name = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchBarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              ProductSearchBar(
                controller: _searchBarController,
              ),
              const SizedBox(height: 16),
              const HomeCarouselSlider(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.navBarAppLogoSvg),
      actions: [
        AppBarIconButton(
          onTap: () {},
          icon: Icons.person_outline,
        ),
        const SizedBox(width: 8),
        AppBarIconButton(
          onTap: () {},
          icon: Icons.call_outlined,
        ),
        const SizedBox(width: 8),
        AppBarIconButton(
          onTap: () {},
          icon: Icons.notifications_outlined,
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}

