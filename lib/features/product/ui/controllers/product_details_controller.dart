import 'package:crafty_bay_ecommerce_project/app/urls.dart';
import 'package:crafty_bay_ecommerce_project/features/product/data/models/product_details_model.dart';
import 'package:crafty_bay_ecommerce_project/services/network_caller/network_caller.dart';
import 'package:crafty_bay_ecommerce_project/services/network_caller/network_response.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  final NetworkCaller networkCaller = Get.find<NetworkCaller>();

  bool _inProgress = false;

  ProductDetailsModel? _productDetailsModel;

  String? _errorMessage;

  bool get inProgress => _inProgress;

  ProductDetails? get productDetails => _productDetailsModel?.data!.first;

  String? get errorMessage => _errorMessage;

  Future<bool> getProductDetails(int productId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await networkCaller.getRequest(Urls.productDetailsUrl(productId));
    if (response.isSuccess) {
      _productDetailsModel = ProductDetailsModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}