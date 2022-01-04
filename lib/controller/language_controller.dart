import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/utils/constant_utils.dart';
import '/utils/pref_manager.dart';
import '../service/settings_service.dart';

class LanguageController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    PreferenceUtils.init();

  }

  void updateLocale(value) async {
    var languageCode ='';
    if (value.contains('_')) {

      languageCode =  value.substring(0, value.indexOf('_'));
      // en_US
   //   Get.updateLocale(Locale(value.split('_').elementAt(0), value.split('_').elementAt(1)));
    } else {
      languageCode = value;
      // en
    //  Get.updateLocale(Locale(value));
    }
    Get.updateLocale(Locale(languageCode.trim()));
    await PreferenceUtils.setString(prefLanguage, languageCode);
    Get.rootController.setTheme(Get.find<SettingsService>().getLightTheme());
   Get.forceAppUpdate();
  }
}
