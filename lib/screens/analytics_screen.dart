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
                switch(selectedMenuBarItem){

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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SectionTitle(
                    sectionTitle: "Sales",
                    viewMore: () {},
                  ),
                  SectionTitle(
                    key: ordersKey,
                    sectionTitle: "Orders",
                    viewMore: () {},
                  ),
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
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
