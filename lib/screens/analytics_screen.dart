import 'package:analytics_screen_ui/core/app_assets.dart';
import 'package:analytics_screen_ui/widgets/custom_card.dart';
import 'package:flutter/material.dart';

import '../core/app_colors.dart';
import '../widgets/menu_bar.dart';
import '../widgets/section_title.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  MenuBarItem selectedMenuBarItem = MenuBarItem.payments;
  var ordersKey = GlobalKey();
  var paymentsKey = GlobalKey();
  var menuKey = GlobalKey();
  var waiterKey = GlobalKey();

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
          CustomMenuBar(
            selectedMenuBarItem: selectedMenuBarItem,
            onSelect: (selected) {
              setState(() {
                selectedMenuBarItem = selected;
                switch (selectedMenuBarItem) {
                  case MenuBarItem.sales:
                    break;
                  case MenuBarItem.orders:
                    Scrollable.ensureVisible(ordersKey.currentContext!);
                    break;
                  case MenuBarItem.payments:
                    Scrollable.ensureVisible(paymentsKey.currentContext!);
                    break;
                  case MenuBarItem.menu:
                    Scrollable.ensureVisible(menuKey.currentContext!);
                    break;
                  case MenuBarItem.waiter:
                    Scrollable.ensureVisible(waiterKey.currentContext!);
                    break;
                }
              });
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    SectionTitle(
                      sectionTitle: "Sales",
                      viewMore: () {},
                    ),
                    CustomCardA(
                        title: "Revenue",
                        subTitle: "Total revenue",
                        total: 2000,
                        customCardListItems: [
                          CustomCardListItem(
                              iconPath: AppAssets.clockGreen,
                              iconColor: AppColors.success50,
                              text: "Revenue per available seat hour",
                              data: 2000),
                          CustomCardListItem(
                              iconPath: AppAssets.gridPink,
                              iconColor: AppColors.error50,
                              text: "Revenue per table",
                              data: 2000)
                        ]),
                    SectionTitle(
                      key: ordersKey,
                      sectionTitle: "Orders",
                      viewMore: () {},
                    ),
                    CustomCardA(
                        title: "Orders",
                        subTitle: "Total Orders",
                        total: -50,
                        customCardListItems: [
                          CustomCardListItem(
                              iconPath: AppAssets.bellYellowOutline,
                              iconColor: AppColors.yellow50,
                              text: "On going",
                              data: 20),
                          CustomCardListItem(
                              iconPath: AppAssets.boxPink,
                              iconColor: AppColors.pink100,
                              text: "Delivery",
                              data: 20),
                          CustomCardListItem(
                              iconPath: AppAssets.bagViolet,
                              iconColor: AppColors.violet50,
                              text: "Take away",
                              data: 20),
                        ]),
                    SectionTitle(
                      key: paymentsKey,
                      sectionTitle: "Payments",
                      viewMore: () {},
                    ),
                    SectionTitle(
                      key: menuKey,
                      sectionTitle: "Menu",
                      viewMore: () {},
                    ),
                    SectionTitle(
                      key: waiterKey,
                      sectionTitle: "Waiter",
                      viewMore: () {},
                    ),
                    CustomCardA(
                        title: "Servings",
                        subTitle: "",
                        total: -650,
                        customCardListItems: [
                          CustomCardListItem(
                              iconPath: AppAssets.sliderGreen,
                              iconColor: AppColors.success50,
                              text: "Tables served",
                              data: 1234),
                          CustomCardListItem(
                              iconPath: AppAssets.peoplePink,
                              iconColor: AppColors.pink100,
                              text: "Guests per server per order",
                              data: 1234),
                          CustomCardListItem(
                              iconPath: AppAssets.userSquareYellow,
                              iconColor: AppColors.yellow50,
                              text: "Per-person average",
                              data: 1234),
                          CustomCardListItem(
                              iconPath: AppAssets.clockYellow,
                              iconColor: AppColors.yellow50,
                              text: "Average serving time",
                              data: 1234),
                        ]),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
