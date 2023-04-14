import 'package:analytics_screen_ui/core/app_assets.dart';
import 'package:flutter/material.dart';

import '../core/app_colors.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle(
      {Key? key, required this.sectionTitle, required this.viewMore})
      : super(key: key);
  final String sectionTitle;
  final void Function() viewMore;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            sectionTitle,
            style: TextStyle(
                color: AppColors.violet400,
                fontFamily: "Inter",
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
          TextButton(onPressed: viewMore, child: Row(
            children: [
              Text(
                "View More",
                style: TextStyle(
                    color: AppColors.neutral600,
                    fontFamily: "Inter",
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(width: 16,),
              Image.asset(AppAssets.rightArrow,width: 16,height: 16,)
            ],
          ),)
        ],
      ),
    );
  }
}
