import 'package:crafty_bay_ecommerce_project/app/urls.dart';
import 'package:crafty_bay_ecommerce_project/features/home/models/banner_list_model.dart';
import 'package:crafty_bay_ecommerce_project/features/home/models/banner_model.dart';
import 'package:crafty_bay_ecommerce_project/services/network_caller/network_caller.dart';
import 'package:crafty_bay_ecommerce_project/services/network_caller/network_response.dart';
import 'package:get/get.dart';

class HomeBannerListController extends GetxController {
  final NetworkCaller networkCaller = Get.find<NetworkCaller>();

  bool _inProgress = false;

  BannerListModel? _bannerListModel;

  String? _errorMessage;

  bool get inProgress => _inProgress;

  List<BannerModel> get bannerList => _bannerListModel?.bannerList ?? [];

  String? get errorMessage => _errorMessage;

  Future<bool> getHomeBannerList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await networkCaller.getRequest(Urls.bannerListUrl);
    if (response.isSuccess) {
      _bannerListModel = BannerListModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}