import 'package:flutter/material.dart';
import 'package:lemon_hotel/utils/dimension.dart';

import 'app_icon.dart';
import 'bigtext.dart';

class AccountWidget extends StatelessWidget {
 final AppIcon appIcon;
 final BigText bigText;
  AccountWidget({Key? key, required this.appIcon, required this.bigText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimen.height15),
      padding: EdgeInsets.only(
          left: Dimen.width20, top: Dimen.width10, bottom: Dimen.width10),
      child: Row(
        children: [
          appIcon,
          SizedBox(
            width: Dimen.width10,
          ),
          bigText,
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular(Dimen.radius15),
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              offset: Offset(0, 5),
              color: Colors.grey.withOpacity(1),
            ),
          ]),
    );
  }
}
