import 'package:crafty_bay_ecommerce_project/app/urls.dart';
import 'package:crafty_bay_ecommerce_project/features/common/data/models/product/product_model.dart';
import 'package:crafty_bay_ecommerce_project/features/common/data/models/product/product_pagination_response_model.dart';
import 'package:crafty_bay_ecommerce_project/services/network_caller/network_caller.dart';
import 'package:crafty_bay_ecommerce_project/services/network_caller/network_response.dart';
import 'package:get/get.dart';

class ProductListController extends GetxController {
  final NetworkCaller _networkCaller = Get.find<NetworkCaller>();

  bool _inProgress = false;

  bool get inProgress => _inProgress;

  bool get initialInProgress => _page == 1 && _inProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  final List<ProductModel> _productList = [];

  List<ProductModel> get productList => _productList;

  final int _count = 30;

  int _page = 0;

  int? _lastPage;

  Future<bool> getProductList() async {
    _page++;
    if (_lastPage != null && _page > _lastPage!) return false;
    bool isSuccess = false;
    _inProgress = true;
    update();
    Map<String, dynamic> queryParams = {
      'count': _count,
      'page': _page,
    };
    final NetworkResponse response = await _networkCaller.getRequest(
      Urls.categoryListUrl,
      queryParas: queryParams,
    );
    if (response.isSuccess) {
      ProductPaginationResponseModel productPaginationResponseModel = ProductPaginationResponseModel.fromJson(response.responseData);
      _productList.addAll(productPaginationResponseModel.data?.results ?? []);
      if (productPaginationResponseModel.data?.lastPage != null) {
        _lastPage = productPaginationResponseModel.data?.lastPage!;
      }
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }

  Future<bool> refreshProductList() async {
    _page = 0;
    _lastPage = null;
    _productList.clear();
    return getProductList();
  }
}
