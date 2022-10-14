import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lemon_hotel/controller/cart_controller.dart';
import 'package:lemon_hotel/controller/popular_product_controller.dart';
import 'package:lemon_hotel/controller/recommended_product_controller.dart';
import 'package:lemon_hotel/model/product_model.dart';
import 'package:lemon_hotel/utils/dimension.dart';
import 'package:lemon_hotel/widget/app_column.dart';
import 'package:lemon_hotel/widget/app_icon.dart';
import 'package:lemon_hotel/widget/bigtext.dart';
import 'package:lemon_hotel/widget/expandble_text.dart';

class RecommendedFoodDetails extends StatelessWidget {
  final int pageId;
  final String page;
  const RecommendedFoodDetails({
    Key? key,
    required this.pageId,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 65,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: AppIcon(
                    icon: Icons.clear,
                    iconColor: Colors.black,
                    backgound: Colors.green.shade200,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                  iconColor: Colors.black,
                  backgound: Colors.green.shade200,
                ),
              ],
            ),
            bottom: PreferredSize(
              child: Container(
                padding: EdgeInsets.only(top: 10, bottom: 5, left: 20),
                height: 40,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Colors.green.shade200),
                child: BigText(
                  text: "Welcome",
                  size: 25,
                ),
              ),
              preferredSize: Size.fromHeight(30),
            ),
            pinned: true,
            backgroundColor: Colors.green,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "images/momo.jpg",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
                height: 500,
                padding: EdgeInsets.only(left: 20, right: 20, top: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: product.name!),
                    SizedBox(
                      height: Dimen.height20,
                    ),
                    BigText(text: "Introduce"),
                    SizedBox(
                      height: Dimen.height10,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: ExpandbleText(
                            text:
                                "By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.”“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.”“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.”“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.”“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engagingBy leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.”“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engagingBy leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.”“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engagingBy leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.”“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.”“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.”“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.”“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.”“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engagingBy leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.”“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engagingBy leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.”“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engagingBy leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.”“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging."),
                        //  ExpandbleText(text: product.description!),
                      ),
                    ),
                  ],
                )),
          ),
          // Container(
          //   // margin: EdgeInsets.only(top: 0),
          //   decoration: BoxDecoration(
          //       color: Colors.green.shade100,
          //       borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(10),
          //         topRight: Radius.circular(10),
          //       )),
          //   height: 1000,
          //   child: ListView.builder(
          //       itemCount: Product.products.length,
          //       itemBuilder: (context, index) {
          //         return Container();
          //         // ProduListCrad(products: Product.products[index]);
          //       }),
          // ),
          // Container(
          //   color: Colors.green.shade100,
          //   margin: EdgeInsets.only(left: 10, top: 10),
          //   child: Text(
          //       "By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.”“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.”“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.”“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.”“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engagingBy leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.”“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engagingBy leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.”“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engagingBy leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.”“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.”“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.”“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.”“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.”“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engagingBy leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.”“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engagingBy leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.”“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engagingBy leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.”“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging.“By leveraging Lottie animations, we can provide a dynamic experience and make it much more fun by showcasing an animation that is much richer and engaging."),
          // ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 95,
        width: double.maxFinite,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            color: Colors.green.shade200),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 5,
                right: 5,
              ),
              height: 60,
              width: 120,
              margin: EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green.shade100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.remove),
                  BigText(text: "0"),
                  Icon(Icons.add),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green.shade100),
              child: Row(
                children: [
                  BigText(text: "\$${10}||Add to cart"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
