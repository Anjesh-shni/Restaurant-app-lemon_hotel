import 'package:get/get.dart';
import 'package:lemon_hotel/cart/cart_page.dart';
import 'package:lemon_hotel/pagaes/food/popular_food_details.dart';
import 'package:lemon_hotel/pagaes/food/recommended_food_details.dart';
import 'package:lemon_hotel/pagaes/morepage/bottom_nav_home.dart';
import 'package:lemon_hotel/pagaes/morepage/splash_screen1.dart';

class RouteHelper {
  //This is for Routing......................................................
  static const String inittial = "/";
  static const String splashPage = "/splash-page";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";

  //This is because we can pass parameter or argument in any page.............
  static String getInitial() => "$inittial";
  static String getSplashPage() => "$splashPage";
  static String getPopularFood(int pageId, String page) =>
      "$popularFood?pageId=$pageId&page=$page";

  static String getRecommendedFood(int pageId, String page) =>
      "$recommendedFood?pageId=$pageId&page=$page";

  static String getCartPage() => '$cartPage';

  //This is list of Routes....................................................
  static List<GetPage> routes = [
    GetPage(name: inittial, page: () => HomeNav()),
    GetPage(name: splashPage, page: () => SplashScreen()),
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters["pageId"];
        final page = Get.parameters["page"];
        return PopularFoodDetails(pageId: int.parse(pageId!), page: page!);
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        var pageId = Get.parameters["pageId"];
        final page = Get.parameters["page"];
        return RecommendedFoodDetails(pageId: int.parse(pageId!), page: page!);
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: cartPage,
      page: () {
        return CartPage();
      },
      transition: Transition.fadeIn,
    ),
  ];
}
