import 'package:crafty_bay_ecommerce_project/app/urls.dart';
import 'package:crafty_bay_ecommerce_project/features/home/data/models/slider_model.dart';
import 'package:crafty_bay_ecommerce_project/features/home/data/models/slider_pagination_response_model.dart';
import 'package:crafty_bay_ecommerce_project/services/network_caller/network_caller.dart';
import 'package:crafty_bay_ecommerce_project/services/network_caller/network_response.dart';
import 'package:get/get.dart';

class HomeSliderListController extends GetxController {
  final NetworkCaller _networkCaller = Get.find<NetworkCaller>();

  bool _inProgress = false;

  SliderPaginationResponseModel? _sliderPaginationResponseModel;

  String? _errorMessage;

  bool get inProgress => _inProgress;

  List<SliderModel> get sliderListDataModel => _sliderPaginationResponseModel?.data?.results ?? [];

  String? get errorMessage => _errorMessage;

  Future<bool> getSliders() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await _networkCaller.getRequest(Urls.homeSlidersUrl);
    if (response.isSuccess) {
      _sliderPaginationResponseModel = SliderPaginationResponseModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}