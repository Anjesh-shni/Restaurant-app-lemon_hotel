import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lemon_hotel/utils/colors.dart';
import 'package:lemon_hotel/widget/bigtext.dart';


void ShowCuastomSnackBAr(String messege,
    {bool isError = true, String title = "Error"}) {
  Get.snackbar(
    title,
    messege,
    snackPosition: SnackPosition.TOP,
    backgroundColor: ApClrs.mainClr,
    titleText: BigText(
      text: title,
      color: Colors.black,
      size: 16,
    ),
    messageText: Text(
      messege,
      style: TextStyle(
        color: Colors.redAccent,
      ),
    ),
  );
}
