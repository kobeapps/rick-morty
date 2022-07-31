import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kobe_start_rick_morty/theme/app_colors.dart';
import 'package:kobe_start_rick_morty/theme/app_images.dart';

import '../pages/home_page.dart';
import '../pages/search.dart';

PreferredSizeWidget appBarComponent(
  BuildContext context, {
  bool isSecondPage = false,
}) {
  return AppBar(
    toolbarHeight: kToolbarHeight * 2.2,
    backgroundColor: AppColors.appBarColor,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    leading: Align(
      alignment: Alignment.topCenter,
      child: GestureDetector(
        onTap: () {
          final currentRoute = ModalRoute.of(context)?.settings.name;

          if (currentRoute == HomePage.routeId) return;

          Navigator.of(context).pop();
        },
        child: Icon(
          isSecondPage ? Icons.arrow_back : Icons.menu,
        ),
      ),
    ),
    actions: [
      Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.only(right: 16),
        child: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            showSearch(context: context, delegate: SearchCharacter());
          },
          color: AppColors.white,
        ),
      ),
    ],
    flexibleSpace: SafeArea(
      child: Column(
        children: [
          Image.asset(AppImages.logo),
          const Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Text(
              "RICK AND MORTY API",
              style: TextStyle(
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
