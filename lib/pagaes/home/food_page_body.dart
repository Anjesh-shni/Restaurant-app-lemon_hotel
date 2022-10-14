import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:lemon_hotel/controller/popular_product_controller.dart';
import 'package:lemon_hotel/controller/recommended_product_controller.dart';
import 'package:lemon_hotel/model/main_model/popular_product_mooel.dart';
import 'package:lemon_hotel/route/routes_helper.dart';
import 'package:lemon_hotel/utils/app_constant.dart';
import 'package:lemon_hotel/widget/bigtext.dart';
import '../../widget/smalltext.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {

  const FoodPageBody({Key? key,}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState(
      );
}

class _FoodPageBodyState extends State<FoodPageBody> {


  PageController pageController = PageController(viewportFraction: 0.9);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = 230;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // //pageview buildder
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return popularProducts.isloaded
              ? Container(
                  height: 280,
                  child: PageView.builder(
                      controller: pageController,
                      itemCount: popularProducts.popularProductList.length,
                      itemBuilder: (context, index) {
                        return _buildPageItem(
                            index, popularProducts.popularProductList[index]);
                      }),
                )
              : Container(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.green,
                    ),
                  ),
                );
        }),

        //Dots indicator
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.isEmpty
                ? 1
                : popularProducts.popularProductList.length,
            position: _currPageValue,
            decorator: DotsDecorator(
              activeColor: Colors.green,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
          );
        }),

        SizedBox(
          height: 15,
        ),

        // Recommended text
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Recommended"),
              SizedBox(
                width: 10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: ".",
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallTxt(
                  text: "Food Pairing",
                  size: 14,
                ),
              ),
            ],
          ),
        ),
        
        // product ListView
        Container(
          height: 600,
          child: GetBuilder<RecommendedProductController>(
            builder: (recommendedProducts) {
              return recommendedProducts.isloaded
                  ? ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: BouncingScrollPhysics(),
                      itemCount:
                          recommendedProducts.recommendedProductList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(
                            RouteHelper.getRecommendedFood(index, "home"));
                          },
                          child: Container(
                            margin:
                                EdgeInsets.only(left: 5, right: 5, bottom: 10),
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.green.shade200,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 100,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          AppConstants.BASE_URL +
                                              AppConstants.UPLOAD_URL +
                                              recommendedProducts
                                                  .recommendedProductList[index]
                                                  .img!,
                                        ),
                                      ),
                                      color: Colors.green.shade200),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 30),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      BigText(
                                          text: recommendedProducts
                                              .recommendedProductList[index]
                                              .name!),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      SmallTxt(
                                        text: "Explore to see more items!",
                                        color: Colors.black.withAlpha(100),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                IconButton(
                                  onPressed: () {
                                  
                                         Get.toNamed(
                            RouteHelper.getRecommendedFood(index, "home")
                                    );
                                  },
                                  icon: Icon(
                                    Icons.touch_app,
                                    color: Colors.black.withAlpha(50),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : Container(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.green,
                        ),
                      ),
                    );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProducts) {
    Matrix4 matrix = new Matrix4.identity();

    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: GestureDetector(
        onTap: () {
         Get.toNamed(RouteHelper.getPopularFood(index, "home"));
        },
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(left: 5, right: 5, top: 10),
              height: 230,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    AppConstants.BASE_URL +
                        AppConstants.UPLOAD_URL +
                        popularProducts.img!,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(left: 40, right: 40, bottom: 15),
                height: 50,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                      BoxShadow(
                        color: Colors.green.shade100,
                        offset: Offset(-5, 0),
                      ),
                      BoxShadow(
                        color: Colors.green.shade100,
                        offset: Offset(5, 0),
                      ),
                    ],
                    color: Colors.green.shade100),
                child: Center(
                  child: BigText(
                    text: popularProducts.name!,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
