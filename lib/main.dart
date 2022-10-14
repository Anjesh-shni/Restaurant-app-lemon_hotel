import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:lemon_hotel/controller/popular_product_controller.dart';
import 'package:lemon_hotel/controller/recommended_product_controller.dart';
import 'package:lemon_hotel/route/routes_helper.dart';
import 'controller/cart_controller.dart';
import 'helper/dependency.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.green,
    ));
    return GetBuilder<PopularProductController>(
      builder: (_) {
        return GetBuilder<RecommendedProductController>(builder: (_) {
          return GetBuilder<CartController>(builder: (_) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Hotel Lemon',
              initialRoute: RouteHelper.getSplashPage(),
              getPages: RouteHelper.routes,
            );
          });
        });
      },
    );
  }
}
