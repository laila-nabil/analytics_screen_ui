import 'package:flutter/material.dart';

import '../core/app_colors.dart';

class CustomMenuBar extends StatelessWidget {
  const CustomMenuBar({Key? key}) : super(key: key);

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
            MenuChip(title: "Today's", onTap: () {}, isSelected: true),
            MenuChip(title: "Orders", onTap: () {}, isSelected: false),
            MenuChip(title: "Payments", onTap: () {}, isSelected: false),
            MenuChip(title: "Menu", onTap: () {}, isSelected: false),
            MenuChip(title: "Waiter", onTap: () {}, isSelected: false),
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
      required this.isSelected})
      : super(key: key);
  final String title;
  final void Function() onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 68,
      height: 28,
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.violet400 : AppColors.violet50,
        border: isSelected ? null : Border.all(color: AppColors.violet800),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              color: isSelected ? AppColors.white00 : AppColors.violet400,
              fontFamily: "Inter",
              fontSize: 12,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
