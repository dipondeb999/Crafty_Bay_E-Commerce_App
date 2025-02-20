import 'package:crafty_bay_ecommerce_project/app/urls.dart';
import 'package:crafty_bay_ecommerce_project/features/common/data/models/product/product_list_data_model.dart';
import 'package:crafty_bay_ecommerce_project/features/common/data/models/product/product_model.dart';
import 'package:crafty_bay_ecommerce_project/services/network_caller/network_caller.dart';
import 'package:crafty_bay_ecommerce_project/services/network_caller/network_response.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  final NetworkCaller _networkCaller = Get.find<NetworkCaller>();

  bool _inProgress = false;

  ProductListDataModel? _productListDataModel;

  String? _errorMessage;

  bool get inProgress => _inProgress;

  ProductModel? get productModel => _productListDataModel?.results?.first;

  String? get errorMessage => _errorMessage;

  Future<bool> getProductDetails(int productId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await _networkCaller.getRequest(Urls.productListUrl);
    if (response.isSuccess) {
      _productListDataModel = ProductListDataModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}