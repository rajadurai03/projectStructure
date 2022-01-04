
import 'package:flutter/material.dart';
import '/utils/colors_utils.dart';
import '/utils/methods_utils.dart';


Widget loadingOverlay(){

  return Container(
    child: Stack(
      children: [
        const Opacity(
          opacity: 0.1,
          child: ModalBarrier(dismissible: false, color: Colors.white),
        ),
        Center(
            child: Container(
              height: 56,
              width: 56,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            )
        ),
        Center(
          child: CircularProgressIndicator(strokeWidth: 3,valueColor: AlwaysStoppedAnimation<Color>(HexColor(primaryLightColor)),),
        ),
      ],
    ),
  );


}
