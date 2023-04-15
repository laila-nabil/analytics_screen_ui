import 'package:analytics_screen_ui/core/app_assets.dart';
import 'package:flutter/material.dart';

import '../core/app_colors.dart';

class CustomCardListItem {
  final String iconPath;
  final Color iconColor;
  final String text;
  final double data;

  CustomCardListItem(
      {required this.iconPath,
      required this.iconColor,
      required this.text,
      required this.data});
}

class CustomCardA extends StatelessWidget {
  const CustomCardA(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.total,
      required this.customCardListItems})
      : super(key: key);
  final String title;
  final String subTitle;
  final double total;
  final List<CustomCardListItem> customCardListItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16,right: 16,bottom: 18),
      margin: EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.white00,
          boxShadow: [
            BoxShadow(color: Color.fromRGBO(23, 23, 23, 0.1), blurRadius: 2)
          ]),
      child: Column(
        children: [
          SizedBox(
            height: 32,
          ),
          Container(
            height: 58,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          color: AppColors.neutral600,
                          fontFamily: "Inter",
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      subTitle,
                      style: TextStyle(
                          color: AppColors.neutral500,
                          fontFamily: "Inter",
                          fontSize: 10,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "${total.abs()}",
                      style: TextStyle(
                          color: total >= 0
                              ? AppColors.success500
                              : AppColors.error500,
                          fontFamily: "Inter",
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    Image.asset(
                      total >= 0
                          ? AppAssets.arrowUpGreen
                          : AppAssets.arrowDownPink,
                      width: 20,
                      height: 20,
                    )
                  ],
                ),
              ],
            ),
          ),
          Divider(),
          ...customCardListItems
              .map((e) => Container(
                    height: 36,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: e.iconColor,
                              borderRadius: BorderRadius.circular(12)),
                          child: Image.asset(e.iconPath,width: 16,height: 16,),
                        ),
                        SizedBox(width: 12,),
                        Text(
                          e.text,
                          style: TextStyle(
                              color: AppColors.neutral600,
                              fontFamily: "Inter",
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        Text(
                          e.data.toString(),
                          style: TextStyle(
                              color: AppColors.neutral600,
                              fontFamily: "Inter",
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ))
              .toList()
        ],
      ),
    );
  }
}
