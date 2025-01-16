import 'package:crafty_bay_ecommerce_project/app/urls.dart';
import 'package:crafty_bay_ecommerce_project/features/auth/data/models/profile_model.dart';
import 'package:crafty_bay_ecommerce_project/services/network_caller/network_caller.dart';
import 'package:crafty_bay_ecommerce_project/services/network_caller/network_response.dart';
import 'package:get/get.dart';

class ReadProfileController extends GetxController {
  final NetworkCaller networkCaller = Get.find<NetworkCaller>();

  bool _inProgress = false;

  String? _errorMessage;

  String? _profileModel;

  bool get inProgress => _inProgress;

  String? get errorMessage => _errorMessage;

  String? get profileModel => _profileModel;

  Future<bool> readProfileData(String token) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await networkCaller.getRequest(Urls.readProfileUrl, accessToken: token);
    if (response.isSuccess) {
      _errorMessage = null;
      if (response.responseData['data'] == null) {
        _profileModel = null;
      } else {
        _profileModel = ProfileModel.fromJson(response.responseData['data']) as String;
      }
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}