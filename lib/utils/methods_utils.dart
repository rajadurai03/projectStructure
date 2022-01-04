import 'dart:convert';
import 'dart:ui' ;
import 'package:get/get.dart';
import 'package:dio/dio.dart' as api;


/// Name  Validation print(validateName("John Doe"));
String? validateName(String value) {
  //Pattern pattern = r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$";
  if (value.isEmpty) {
    return 'name_errorText'.tr;
  } else if (value.isNotEmpty && value.length<3) {
    bool nameValid = true;
    return nameValid ? null : "invalid".tr;
  }
}
/// Phone num Validation print(validatePhone("9876543210"));
String? validatePhone(String value) {
  String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  if (value.isEmpty) {
    return 'mobile_errorText'.tr;
  } else if (value.isNotEmpty && value.length < 10) {
    bool mobileValid = RegExp(pattern).hasMatch(value);
    return mobileValid ? null : "invalid".tr;
  }
}
/// Email Validation   print(validateEmail("check@gmail.com"));
String? validateEmail(String value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  if (value.isEmpty) {
    return 'email_errorText'.tr;
  } else if (value.isNotEmpty) {
    bool emailValid = RegExp(pattern).hasMatch(value);
    return emailValid ? null : "invalid".tr;
  }
}
/// Date of birth Validation
String? validateDob(String value) {
  String pattern =
      r'^(0[1-9]|1[012])[-/.](0[1-9]|[12][0-9]|3[01])[-/.](19|20)\d\d$';
  if (value.isEmpty) {
    return 'dob_errorText'.tr;
  } else if (value.isNotEmpty) {
    bool emailValid = RegExp(pattern).hasMatch(value);
    return emailValid ? null : "invalid".tr;
  }
}
/// Nationality  Validation
String? validateNationality(String value) {
  if (value.isEmpty) {
    return 'nationality_errorText'.tr;
  } else if (value.isNotEmpty ) {
    bool nameValid = true;
    return nameValid ? null : "invalid".tr;
  }
}
/// Gender  Validation
String? validateGender(String value) {
  if (value.isEmpty) {
    return 'gender_errorText'.tr;
  } else if (value.isNotEmpty ) {
    bool nameValid = true;
    return nameValid ? null : "invalid".tr;
  }
}
/// Aadhar number  Validation
String? validateAadhar(String value) {
  String pattern = r'(^\d{4}\d{4}\d{4}$)';
  if (value.isEmpty) {
    return 'aadhar_errorText'.tr;
  } else if (value.isNotEmpty ) {
    bool mobileValid = RegExp(pattern).hasMatch(value);
    return mobileValid ? null : "invalid".tr;
  }
}

String convertMaptoString(Map<String,dynamic> value){
  return json.encode(value);
}

Map<String,dynamic> convertStringtoMap(String value){
  return jsonDecode(value);
}
api.FormData inputParams(Map<String,dynamic> map){
  print("PARAMS:- $map" );
  return api.FormData.fromMap(map);
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

