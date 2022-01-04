class SettingResponse {
  String? appName;
  String? enableStripe;
  String? defaultTax;
  String? defaultCurrency;
  String? fcmKey;
  String? enablePaypal;
  String? defaultTheme;
  String? googleMapsKey;
  String? mobileLanguage;
  String? appVersion;
  String? enableVersion;
  String? currencyRight;
  int? defaultCurrencyDecimalDigits;
  String? enableRazorpay;


  SettingResponse({
    this.appName,
    this.enableStripe,
    this.defaultTax,
    this.defaultCurrency,
    this.fcmKey,
    this.enablePaypal,
    this.defaultTheme,
    this.googleMapsKey,
    this.mobileLanguage,
    this.appVersion,
    this.enableVersion,
    this.currencyRight,
    this.defaultCurrencyDecimalDigits,
    this.enableRazorpay,

  });

  SettingResponse.fromJson(Map<String, dynamic> json) {
    appName = json['app_name'];
    enableStripe = json['enable_stripe'];
    defaultTax = json['default_tax'];
    defaultCurrency = json['default_currency'];
    fcmKey = json['fcm_key'];
    enablePaypal = json['enable_paypal'];
    defaultTheme = json['default_theme'];
    googleMapsKey = json['google_maps_key'];
    mobileLanguage = json['mobile_language'];
    appVersion = json['app_version'];
    enableVersion = json['enable_version'];
    currencyRight = json['currency_right'];
    defaultCurrencyDecimalDigits = json['default_currency_decimal_digits'];
    enableRazorpay = json['enable_razorpay'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['app_name'] = appName;
    data['enable_stripe'] = enableStripe;
    data['default_tax'] = defaultTax;
    data['default_currency'] = defaultCurrency;
    data['fcm_key'] = fcmKey;
    data['enable_paypal'] = enablePaypal;
    data['default_theme'] = defaultTheme;
    data['google_maps_key'] = googleMapsKey;
    data['mobile_language'] = mobileLanguage;
    data['app_version'] = appVersion;
    data['enable_version'] = enableVersion;
    data['currency_right'] = currencyRight;
    data['default_currency_decimal_digits'] = defaultCurrencyDecimalDigits;
    data['enable_razorpay'] = enableRazorpay;
    return data;
  }
}
