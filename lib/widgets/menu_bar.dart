import 'package:flutter/material.dart';

import '../core/app_colors.dart';

enum MenuBarItem { sales, orders, payments, menu, waiter }

class CustomMenuBar extends StatelessWidget {
  const CustomMenuBar(
      {Key? key, required this.selectedMenuBarItem, required this.onSelect})
      : super(key: key);
  final MenuBarItem selectedMenuBarItem;
  final void Function(MenuBarItem) onSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.violet50,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12))),
      alignment: Alignment.center,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            MenuChip(title: "Today's", onTap: () {}, isHighlighted: true),
            MenuChip(
                title: capitalize(MenuBarItem.orders.name),
                onTap: () {onSelect(MenuBarItem.orders);},
                isHighlighted: selectedMenuBarItem == MenuBarItem.orders),
            MenuChip(
                title: capitalize(MenuBarItem.payments.name),
                onTap: () {onSelect(MenuBarItem.payments);},
                isHighlighted: selectedMenuBarItem == MenuBarItem.payments),
            MenuChip(
                title: capitalize(MenuBarItem.menu.name),
                onTap: () {onSelect(MenuBarItem.menu);},
                isHighlighted: selectedMenuBarItem == MenuBarItem.menu),
            MenuChip(
                title: capitalize(MenuBarItem.waiter.name),
                onTap: () {onSelect(MenuBarItem.waiter);},
                isHighlighted: selectedMenuBarItem == MenuBarItem.waiter),
          ],
        ),
      ),
    );
  }
}

class MenuChip extends StatelessWidget {
  const MenuChip(
      {Key? key,
      required this.title,
      required this.onTap,
      required this.isHighlighted})
      : super(key: key);
  final String title;
  final void Function() onTap;
  final bool isHighlighted;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 68,
        height: 28,
        margin: EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: isHighlighted ? AppColors.violet400 : AppColors.violet50,
          border: isHighlighted ? null : Border.all(color: AppColors.violet800),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: isHighlighted ? AppColors.white00 : AppColors.violet400,
                fontFamily: "Inter",
                fontSize: 12,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}

String capitalize(String s) {
  if (s.isEmpty) {
    return s;
  }
  return s.substring(0, 1).toUpperCase() + s.substring(1).toLowerCase();
}
