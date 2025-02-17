import 'package:crafty_bay_ecommerce_project/app/urls.dart';
import 'package:crafty_bay_ecommerce_project/features/common/data/models/category/category_model.dart';
import 'package:crafty_bay_ecommerce_project/features/common/data/models/category/category_pagination_response_model.dart';
import 'package:crafty_bay_ecommerce_project/services/network_caller/network_caller.dart';
import 'package:crafty_bay_ecommerce_project/services/network_caller/network_response.dart';
import 'package:get/get.dart';

class CategoryListController extends GetxController {
  final NetworkCaller _networkCaller = Get.find<NetworkCaller>();

  bool _inProgress = false;

  bool get inProgress => _inProgress;

  bool get initialInProgress => _page == 1 && _inProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  final List<CategoryModel> _categoryList = [];

  List<CategoryModel> get categoryList => _categoryList;

  final int _count = 30;

  int _page = 0;

  int? _lastPage;

  Future<bool> getCategoryList() async {
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
      CategoryPaginationResponseModel categoryPaginationResponseModel = CategoryPaginationResponseModel.fromJson(response.responseData);
      _categoryList.addAll(categoryPaginationResponseModel.data?.results ?? []);
      if (categoryPaginationResponseModel.data?.lastPage != null) {
        _lastPage = categoryPaginationResponseModel.data?.lastPage!;
      }
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }

  Future<bool> refreshCategoryList() async {
    _page = 0;
    _lastPage = null;
    _categoryList.clear();
    return getCategoryList();
  }
}
