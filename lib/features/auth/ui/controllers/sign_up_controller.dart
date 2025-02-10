import 'package:crafty_bay_ecommerce_project/app/urls.dart';
import 'package:crafty_bay_ecommerce_project/features/auth/data/models/sign_up_model.dart';
import 'package:crafty_bay_ecommerce_project/services/network_caller/network_caller.dart';
import 'package:crafty_bay_ecommerce_project/services/network_caller/network_response.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final NetworkCaller _networkCaller = Get.find<NetworkCaller>();

  bool _inProgress = false;

  String? _errorMessage;

  bool get inProgress => _inProgress;

  String? get errorMessage => _errorMessage;

  Future<bool> signUp(SignUpModel signUpModel) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await _networkCaller.postRequest(
        Urls.signUpUrl,
      body: signUpModel.toJson(),
    );
    if (response.isSuccess) {
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}