import 'package:crafty_bay_ecommerce_project/app/app_colors.dart';
import 'package:crafty_bay_ecommerce_project/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay_ecommerce_project/features/common/ui/widgets/product_quantity_inc_dec_button.dart';
import 'package:crafty_bay_ecommerce_project/features/product/data/models/product_details_model.dart';
import 'package:crafty_bay_ecommerce_project/features/product/ui/controllers/product_details_controller.dart';
import 'package:crafty_bay_ecommerce_project/features/product/ui/screens/reviews_screen.dart';
import 'package:crafty_bay_ecommerce_project/features/product/ui/widgets/color_picker_widget.dart';
import 'package:crafty_bay_ecommerce_project/features/product/ui/widgets/product_image_carousel_slider.dart';
import 'package:crafty_bay_ecommerce_project/features/product/ui/widgets/size_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProductDetailsScreen extends StatefulWidget {
  final int productId;

  const ProductDetailsScreen({super.key, required this.productId});

  static const String name = '/product-details-screen';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final ProductDetailsController _productDetailsController = Get.find<ProductDetailsController>();

  @override
  void initState() {
    super.initState();
    _productDetailsController.getProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: GetBuilder<ProductDetailsController>(
        builder: (controller) {
          if (controller.inProgress) {
            return const CenteredCircularProgressIndicator();
          }
          
          if (controller.errorMessage != null) {
            return Center(
              child: Text(controller.errorMessage!),
            );
          }

          ProductDetails productDetails = controller.productDetails!;

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      ProductImageCarouselSlider(
                        imageUrls: [
                          productDetails.img1!,
                          productDetails.img2!,
                          productDetails.img3!,
                          productDetails.img4!,
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildProductTitleSection(
                                textTheme,
                                title: productDetails.product?.title ?? '',
                                star: '${productDetails.product?.star ?? '0.0'}',
                            ),
                          const SizedBox(height: 16),
                            _buildColorSection(
                                textTheme,
                                colors:  productDetails.color?.split(',') ?? [],
                            ),
                            const SizedBox(height: 16),
                            _buildSizeSection(
                              textTheme,
                              sizes: productDetails.size?.split(',') ?? [],
                            ),
                            const SizedBox(height: 16),
                            _buildDescriptionSection(
                                textTheme,
                                description: productDetails.des ?? '',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _buildPriceAndAddToCartSection(
                  textTheme,
                  price: productDetails.product?.price ?? '',
              ),
            ],
          );
        }
      ),
    );
  }

  Widget _buildProductTitleSection(TextTheme textTheme, {required String title, required String star}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Wrap(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 18,
                      ),
                      SizedBox(width: 4),
                      Text(
                        star,
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, ReviewsScreen.name);
                    },
                    child: const Text('Reviews'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: AppColors.themeColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Icon(
                      Icons.favorite_outline,
                      color: Colors.white,
                      size: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        ProductQuantityIncDecButton(
          onChange: (int value) {},
        ),
      ],
    );
  }

  Widget _buildColorSection(TextTheme textTheme, {required List<String> colors}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Color',
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        ColorPickerWidget(
          colors: colors,
          onColorSelected: (String selectedColor) {},
        ),
      ],
    );
  }

  Widget _buildSizeSection(TextTheme textTheme, {required List<String> sizes}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Size',
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        SizePickerWidget(
          sizes: sizes,
          onSizeSelected: (String selectedSize) {},
        ),
      ],
    );
  }

  Widget _buildDescriptionSection(TextTheme textTheme, {required String description}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildPriceAndAddToCartSection(TextTheme textTheme, {required String price}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withOpacity(0.15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Price',
                style: textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '\$$price',
                style: TextStyle(
                  color: AppColors.themeColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Add to Cart'),
            ),
          ),
        ],
      ),
    );
  }
}
