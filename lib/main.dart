import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'package:get/get.dart';
import 'package:jiran_app/app/core/theme.dart';
import 'package:jiran_app/app/core/variables.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  apiUrl = dotenv.env["API_URL"]!;
  stripePubKey = dotenv.env["STRIPE_PUB_KEY"]!;
  stripeSecret = dotenv.env["STRIPE_SECRET"]!;

  fpxMerchantPublicKey = dotenv.env["FPX_MERCHANT_PUBLIC_KEY"]!;
  fpxMerchantApiKey = dotenv.env["FPX_MERCHANT_API_KEY"]!;
  fpxSecretKey = dotenv.env["FPX_SECRET_KEY"]!;
  fpxApiUrl = '${dotenv.env["FPX_API"]!}/$fpxMerchantPublicKey';
  fpxResponseApiUrl = dotenv.env["FPX_RESPONSE_API"]!;

  Stripe.publishableKey = stripePubKey;
  await Stripe.instance.applySettings();

  runApp(
    GetMaterialApp(
      title: "Jiran",
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: AppTheme.primaryTheme
    ),
  );
}
