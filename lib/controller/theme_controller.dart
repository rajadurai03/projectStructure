import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '/utils/constant_utils.dart';
import '/utils/pref_manager.dart';

class ThemeModeController extends GetxController {
  var selectedThemeMode = ThemeMode.light.obs;


  ThemeModeController() {
    PreferenceUtils.init();
  }

  @override
  void onInit() {
    initThemeMode();
    super.onInit();
  }

  initThemeMode() {

    String? _themeMode = PreferenceUtils.getString(prefThemeMode);

    switch (_themeMode) {
      case 'ThemeMode.light':
        selectedThemeMode.value = ThemeMode.light;
        break;
      case 'ThemeMode.dark':
        selectedThemeMode.value = ThemeMode.dark;
        break;
      case 'ThemeMode.system':
        selectedThemeMode.value = ThemeMode.system;
        break;
      default:
        selectedThemeMode.value = ThemeMode.system;
    }
  }

  void changeThemeMode(ThemeMode? themeMode) {
    Get.changeThemeMode(themeMode!);
    selectedThemeMode.value = themeMode;

    if (themeMode == ThemeMode.dark) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark
            .copyWith(systemNavigationBarColor: Colors.black87),
      );
    } else {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light
            .copyWith(systemNavigationBarColor: Colors.transparent),
      );
    }

    PreferenceUtils.setString(prefThemeMode,themeMode.toString());
    Get.rootController.refresh();
  }
}
