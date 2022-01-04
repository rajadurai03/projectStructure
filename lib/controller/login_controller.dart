import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/methods_utils.dart';
import '/service/api_provider.dart';
import '../widget/loading_overlay.dart';
import '../model/setting_response.dart';
import '../service/settings_service.dart';

class LoginController extends GetxController{
final SettingResponse settings = Get.find<SettingsService>().setting.value;

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();





/*void getApiData(String user,String password,String window,
    { Map<String, dynamic>? registerUserDatas}){
  Map<String, dynamic> input ={
    "user_name":user,
    "user_password":password,
    "window":window
  };
  Get.dialog(loadingOverlay());
  APIProvider().loginAPI(
    params: inputParams(input),
    onSuccess: (data) {
      Get.back();

    },
    onError: (error) {
      Get.back();
      print(error);
    },
  );
  update();
}*/
}