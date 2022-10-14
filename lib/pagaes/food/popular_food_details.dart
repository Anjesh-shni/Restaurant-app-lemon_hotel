import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lemon_hotel/controller/cart_controller.dart';
import 'package:lemon_hotel/controller/popular_product_controller.dart';
import 'package:lemon_hotel/utils/app_constant.dart';
import 'package:lemon_hotel/utils/dimension.dart';
import 'package:lemon_hotel/widget/app_column.dart';
import 'package:lemon_hotel/widget/app_icon.dart';
import 'package:lemon_hotel/widget/bigtext.dart';
import 'package:lemon_hotel/widget/expandble_text.dart';

class PopularFoodDetails extends StatelessWidget {
  final int pageId;
  final String page;
  PopularFoodDetails({
    Key? key,
    required this.pageId,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];

    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //Image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: 340,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(AppConstants.BASE_URL +
                      AppConstants.UPLOAD_URL +
                      product.img!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          //Icon
          Positioned(
            top: Dimen.height45 + 5,
            left: Dimen.width15,
            right: Dimen.width15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: AppIcon(
                      icon: Icons.arrow_back_ios,
                      iconColor: Colors.black,
                      backgound: Colors.green.shade200,
                    )),
                GestureDetector(
                  onTap: () {},
                  child: AppIcon(
                    icon: Icons.shopping_cart_outlined,
                    iconColor: Colors.black,
                    backgound: Colors.green.shade200,
                  ),
                ),
              ],
            ),
          ),

          // Name & description
          Positioned(
            top: 310 - 20,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                      ),
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: product.name!),
                    SizedBox(
                      height: Dimen.height20,
                    ),
                    BigText(text: "Introduce"),
                    SizedBox(
                      height: Dimen.height20,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: ExpandbleText(text: product.description!),
                      ),
                    ),
                  ],
                )
                // ListView.builder(
                //   itemCount: Product.products.length,
                //   itemBuilder: (context, index) {
                //     return Container();
                //     //  ProduListCrad(products: Product.products[index]);
                //   },
                // ),
                ),
          ),
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
