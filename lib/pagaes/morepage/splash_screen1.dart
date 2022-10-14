import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:google_fonts/google_fonts.dart';
import 'package:lemon_hotel/controller/cart_controller.dart';
import 'package:lemon_hotel/controller/popular_product_controller.dart';
import 'package:lemon_hotel/controller/recommended_product_controller.dart';
import 'package:lemon_hotel/route/routes_helper.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _coffeeController;
  bool isGreenCoffee = false;
  bool isTextReady = false;

  Future<void> _loadResources() async {
    Get.find<CartController>().getCartData();
    await Get.find<PopularProductController>().getPopulaProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  void initState() {
    Timer(const Duration(seconds: 10),
        () => Get.offNamed(RouteHelper.getInitial()));

    _loadResources();
    super.initState();
    _coffeeController = AnimationController(vsync: this);
    _coffeeController.addListener(() {
      if (_coffeeController.value > 0.7) {
        isGreenCoffee = true;
        setState(() {});
        Future.delayed(const Duration(seconds: 1), () {
          isTextReady = true;
          setState(() {});
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0XFFF8DC9C),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  AnimatedContainer(
                    height: isGreenCoffee ? (height / 1.45) : height,
                    duration: const Duration(seconds: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(3, 3),
                            blurRadius: 10,
                            spreadRadius: 2,
                            color: Colors.black26,
                          ),
                        ],
                        borderRadius: BorderRadius.only(
                          bottomLeft:
                              Radius.circular(isGreenCoffee ? 25.0 : 0.0),
                          bottomRight:
                              Radius.circular(isGreenCoffee ? 25.0 : 0.0),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AnimatedCrossFade(
                          firstChild: Lottie.asset('images/foodprep2.json'),
                          secondChild: Lottie.asset(
                            'images/foodprep1.json',
                            controller: _coffeeController,
                            height: height / 2,
                            onLoaded: (composition) {
                              _coffeeController.duration = composition.duration;
                              _coffeeController.forward();
                            },
                          ),
                          crossFadeState: isGreenCoffee
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                          duration: const Duration(seconds: 4),
                        ),
                        Center(
                          child: AnimatedOpacity(
                            opacity: isTextReady ? 1 : 0,
                            duration: const Duration(seconds: 4),
                            child: Text(
                              "WELCOME!!!",
                              style: GoogleFonts.lobster(
                                  textStyle: const TextStyle(
                                fontSize: 26.0,
                                color: Color(0XFF674335),
                                fontWeight: FontWeight.bold,
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // GestureDetector(
              //   onTap: () {
              //     // Get.to(MyStatefulWidget);
              //     // Get.offNamed(RouteHelper.getInitial());
              //   },
              //   child: Container(
              //     margin: EdgeInsets.only(
              //         top: Dimen.height40 * 4.5, left: Dimen.width30 * 8),
              //     padding: EdgeInsets.all(16),
              //     decoration: BoxDecoration(
              //       color: Colors.blueGrey,
              //       borderRadius:
              //           BorderRadiusDirectional.circular(Dimen.radius15),
              //     ),
              //     child: Text(
              //       "Login",
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 20,
              //         fontWeight: FontWeight.normal,
              //       ),
              //       textAlign: TextAlign.right,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _coffeeController.dispose();
    super.dispose();
  }
}
