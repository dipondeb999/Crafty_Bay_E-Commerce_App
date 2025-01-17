import 'package:crafty_bay_ecommerce_project/app/urls.dart';
import 'package:crafty_bay_ecommerce_project/features/common/data/models/category_list_model.dart';
import 'package:crafty_bay_ecommerce_project/features/common/data/models/category_model.dart';
import 'package:crafty_bay_ecommerce_project/services/network_caller/network_caller.dart';
import 'package:crafty_bay_ecommerce_project/services/network_caller/network_response.dart';
import 'package:get/get.dart';

class CategoryListController extends GetxController {
  final NetworkCaller networkCaller = Get.find<NetworkCaller>();

  bool _inProgress = false;

  CategoryListModel? _categoryListModel;

  String? _errorMessage;

  bool get inProgress => _inProgress;

  List<CategoryModel> get categoryList => _categoryListModel?.categoryList ?? [];

  String? get errorMessage => _errorMessage;

  Future<bool> getCategoryList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await networkCaller.getRequest(Urls.categoryListUrl);
    if (response.isSuccess) {
      _categoryListModel = CategoryListModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}