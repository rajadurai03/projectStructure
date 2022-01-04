import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '/utils/constant_utils.dart';
import 'utils/pref_manager.dart';
import 'navigation/route_collection.dart';
import 'navigation/route_name.dart';
import 'service/settings_service.dart';
import 'service/translation_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync(() => PreferenceUtils.init());


  // CALLING SERVICE
  await Get.putAsync(() => TranslationService().init());
  await Get.putAsync(() => SettingsService().init());

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final navigatorKey = GlobalKey<NavigatorState>();
  late String language = '';
  @override
  void initState() {
    getLanguge();

    print('INIT Method Calling After ${language}   =====   ${language.runtimeType}');
    super.initState();
  }

  Future<void> getLanguge()async{


    String? _locale = PreferenceUtils.getString(prefLanguage);
    if (_locale == null || _locale.isEmpty) {
      _locale = 'en';
    }

    print('VALUE OF OPEN SETTING SERVICE CONTROLLER LANGUGE IS=== ${_locale}');

    language = _locale;
    print('void Function Method Calling After ${language}   =====   ${language.runtimeType}');
  }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialRoute: RouteName.rootRoute, //FIRST PAGE LAUNCHED
        getPages: RouteCollection.routeCollection, //COLLECTION ROUTE

        //defaultTransition: Transition.fade,
        enableLog: true,
        navigatorKey: navigatorKey,

        //LOCALIZATIONS

        locale: language == null ? Get.deviceLocale : Locale(language),
        localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
        supportedLocales: Get.find<TranslationService>().supportedLocales(),
        translationsKeys: Get.find<TranslationService>().translations,
        fallbackLocale: Get.find<TranslationService>().fallbackLocale,
        defaultTransition: Transition.cupertino,
        debugShowCheckedModeBanner: false,

        //THEME
        themeMode: Get.find<SettingsService>().getThemeMode(),
        theme: Get.find<SettingsService>().getLightTheme(),
        darkTheme: Get.find<SettingsService>().getDarkTheme());
  }
}
