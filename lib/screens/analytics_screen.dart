import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../widgets/menu_bar.dart';
import '../widgets/section_title.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.violet800,
        ),
        backgroundColor: AppColors.violet50,
        title: Text(
          "Analytics",
          style: TextStyle(
              color: AppColors.violet800,
              fontFamily: "DMSans",
              fontSize: 16,
              fontWeight: FontWeight.w700),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          CustomMenuBar(),
          Padding(padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SectionTitle(sectionTitle: "Sales",viewMore: (){},),
              SectionTitle(sectionTitle: "Orders",viewMore: (){},),
              SectionTitle(sectionTitle: "Payments",viewMore: (){},),
              SectionTitle(sectionTitle: "Menu",viewMore: (){},),
              SectionTitle(sectionTitle: "Waiter",viewMore: (){},),
            ],
          ),
          )
        ],
      ),
    );
  }
}
