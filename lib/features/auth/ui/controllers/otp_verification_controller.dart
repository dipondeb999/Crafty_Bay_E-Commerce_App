import 'package:crafty_bay_ecommerce_project/app/urls.dart';
import 'package:crafty_bay_ecommerce_project/features/auth/data/models/profile_model.dart';
import 'package:crafty_bay_ecommerce_project/features/auth/ui/controllers/read_profile_controller.dart';
import 'package:crafty_bay_ecommerce_project/features/common/ui/controllers/auth_controller.dart';
import 'package:crafty_bay_ecommerce_project/services/network_caller/network_caller.dart';
import 'package:crafty_bay_ecommerce_project/services/network_caller/network_response.dart';
import 'package:get/get.dart';

class OtpVerificationController extends GetxController {
  final NetworkCaller networkCaller = Get.find<NetworkCaller>();

  bool _inProgress = false;

  String? _errorMessage;

  bool _shouldNavigateCompleteProfile = false;

  String? _token;

  bool get inProgress => _inProgress;

  String? get errorMessage => _errorMessage;

  bool get shouldNavigateCompleteProfile => _shouldNavigateCompleteProfile;

  String? get token => _token;

  Future<bool> verifyOtp(String email, String otp) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await networkCaller.getRequest(Urls.verifyOtpUrl(email, otp));
    if (response.isSuccess) {
      _errorMessage = null;
      isSuccess = true;
      String token = response.responseData['data'];
      await Get.find<ReadProfileController>().readProfileData(token);
      if (Get.find<ReadProfileController>().profileModel == null) {
        _shouldNavigateCompleteProfile = true;
      } else {
        _shouldNavigateCompleteProfile = false;
         // await Get.find<AuthController>().saveUserData(token, Get.find<ReadProfileController>().profileModel as ProfileModel);
      }
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}