import 'package:flutter/material.dart';
import 'package:housen/providers/dark_theme_provider.dart';
import 'package:housen/providers/home_provider.dart';
import 'package:provider/provider.dart';

import '../../style/colors.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: context.watch<DarkModeProvider>().isDark
          ? const TextStyle(color: Colors.white)
          : TextStyle(color: darkColor),
      controller: context.watch<HomeProvider>().searchController,
      onChanged: (val) {
        if (val.isEmpty) {
          context.read<HomeProvider>().getHomeData();
        }
      },
      decoration: InputDecoration(
        hintText: "Search for address",
        border: InputBorder.none,
        prefixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.search),
            const SizedBox(
              width: 3,
            ),
            Container(
              height: 22,
              width: 2,
              color: secondaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
