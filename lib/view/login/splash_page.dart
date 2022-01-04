import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/controller.dart';




class SplashPage extends StatelessWidget {
 SplashPage({Key? key}) : super(key: key);

  final SplashController controller = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Text('MY SPALSH SCREEN',
                style: Get.textTheme.headline6!.merge(const TextStyle(fontSize: 24)))));
  }
}

